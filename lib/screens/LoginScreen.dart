import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mind_tales/screens/HomeScreen.dart';
import 'package:mind_tales/screens/MoodTrackScreen.dart';
import 'package:mind_tales/screens/OTPVerification.dart';
import 'package:mind_tales/screens/SignUpScreen.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  bool islogin = false;
  late String _username;
  late String _contactnumber;

  authentication() async {
    final validity = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (validity) {
      _formkey.currentState!.save();
      submitform(_email, _password, _username);
    }
  }

  submitform(String email, String password, String username) async {
    final auth = FirebaseAuth.instance;
    UserCredential authresult;
    try {
      if (islogin) {
        authresult = await auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } else {
        authresult = await auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        String uid = authresult.user!.uid;
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'username': username,
          'email': email,
        });
       
      }
    } catch (error) {
      print(error);
      Fluttertoast.showToast(msg: "Invalid username or password");

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

      UserCredential result = await _auth.signInWithCredential(authCredential);
      User? user = result.user;
      print(result.user!.email);

      if (result != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(result.user!.uid)
            .set({
          'username': result.user!.displayName,
          'email': result.user!.email,
          'contactnumber': result.user!.phoneNumber,
          'uid': result.user!.uid,
          'password': "12345678",
        });
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MoodTrackScreen()));
      }
    }
  }

  Future<void> otpverification() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: _contactnumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        SignUpScreen.verify = verificationId;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPVerification(),
            ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          // ignore: sort_child_properties_last
          child: Column(
            children: [
              Text(
                'Welcome Back!!',
                style: GoogleFonts.inter(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Form(
                  child: Column(
                    children: [
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
                      SizedBox(height: 20.h),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                              onPressed: () async {
                                await FirebaseAuth.instance
                                    .sendPasswordResetEmail(email: _email);
                                // ignore: use_build_context_synchronously
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text('Password Reset Email Sent'),
                                    content: Text(
                                        'Please check your email to reset your password.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 51.0.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        // margin: EdgeInsets.only(left: 20,right: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.circular(30.0.r),
                        ),
                        child: MaterialButton(
                            onPressed: () async {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: _email, password: _password);
                              // print(user.user?.uid);
                              // await storage.write(key:'uid',value:user.user?.uid);
                              // print("------->>>>>");
                              try {
                                if (user != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MoodTrackScreen(),
                                      ));
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Text('Sign In', style: kbutton)),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Text(
                        'Or',
                        style: kskipbutton,
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      InkWell(
                        onTap: () {
                          signup();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 25.h,
                                child: Image.asset('images/google.png')),
                            SizedBox(width: 10.w),
                            Text('Continue with Google',
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        ),
      ),
    );
  }
}
