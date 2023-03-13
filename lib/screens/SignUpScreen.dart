import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mind_tales/screens/HomeScreen.dart';
import 'package:mind_tales/screens/MoodTrackScreen.dart';
import 'package:mind_tales/screens/OTPVerification.dart';
import '../constants.dart';
import 'LoginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String verify = '';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  late String _contactnumber;
  late String _username;
  TextEditingController countryController = TextEditingController();

  bool islogin = false;

  authentication() async {
    final validity = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (validity) {
      _formkey.currentState!.save();
      submitform(_email, _password, _username, _contactnumber);
    }
  }

  submitform(String email, String password, String username,
      String contactnumber) async {
    final auth = FirebaseAuth.instance;
    UserCredential authresult;
    try {
      if (islogin) {
        authresult = await auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } else {
        authresult = await auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        String uid = authresult.user!.uid;
        // print('----------------->'+uid);
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'username': username,
          'email': email,
          'contactnumber': contactnumber,
          'uid':uid,
          'password':password,
          'profile_photo':"abc",
        });
        print('User added');
           Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MoodTrackScreen()));

      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> signup() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      print(result);

      if (result != null) {
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
  }

  Future<void> otpverification() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber:'+91'+_contactnumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        SignUpScreen.verify = verificationId;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OTPVerification(),
            ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        resizeToAvoidBottomInset: true,
        body: Center(
          child: SingleChildScrollView(
             reverse: true,
            // ignore: sort_child_properties_last
            child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Create account',
                style: GoogleFonts.inter(
                    fontSize: 36.sp, fontWeight: FontWeight.w600),
              ),
               SizedBox(height: 7.0.h),
              Text(
                'To get started now!',
                style: GoogleFonts.inter(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) {
                            _username = value;
                          },
                          decoration: kdecoration.copyWith(
                              hintText: 'Enter your username')),
                      SizedBox(height: 15.h),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: MultiValidator([
                            EmailValidator(errorText: "Not a valid email"),
                            RequiredValidator(errorText: "Required*"),
                          ]),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            _email = value;
                          },
                          decoration: kdecoration.copyWith(
                              hintText: 'Enter you email')),
                      SizedBox(height: 15.h),
                   
                      TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              _contactnumber = value;
                            },
                            decoration: kdecoration.copyWith(
                                hintText: 'Enter you contact number')),
                      
                       SizedBox(height: 15.h),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          validator: MinLengthValidator(6,
                              errorText: "It should be atleast 6 characters"),
                          onChanged: (value) {
                            _password = value;
                          },
                          decoration: kdecoration.copyWith(
                              hintText: 'Enter you password')),
                      SizedBox(
                        height: 65.0.h,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        // margin: EdgeInsets.only(left: 20,right: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.circular(30.0.r),
                        ),
                        child: MaterialButton(
                            onPressed: () async {
                              authentication();
                             
                            },
                            child: Text('Sign Up', style: kbutton)),
                      ),
                   
                   
                    ],
                  ),
                ),
              ),
            ]),
             padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
          ),
        ),
      ),
    );
  }
}
