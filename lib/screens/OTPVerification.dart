import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_tales/screens/LoginScreen.dart';
import 'package:mind_tales/screens/MoodTrackScreen.dart';
import 'package:mind_tales/screens/SignUpScreen.dart';
import 'package:pinput/pinput.dart';

import '../constants.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  late String otpcode;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OTP Verification',
                  style: GoogleFonts.inter(
                      fontSize: 25.sp, fontWeight: FontWeight.w600),
                ),
                Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Text(
                      'A verification code has been sent to your phone number.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: 18.sp, fontWeight: FontWeight.w500),
                    )),
                 SizedBox(
                  height: 25.0.h,
                ),
                Pinput(
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onCompleted: (value) {
                    setState(() {
                      otpcode = value;
                    });
                  },
                ),
                 SizedBox(
                  height: 65.0.h,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  // margin: EdgeInsets.only(right:11,left: 11),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.circular(30.0.r),
                  ),
                  child: MaterialButton(
                      onPressed: () async {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: SignUpScreen.verify,
                                  smsCode: otpcode);

                          await auth.signInWithCredential(credential);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            MoodTrackScreen(),
                          ));
                        } catch (e) {
                          print(e);
                          Fluttertoast.showToast(msg: "Invalid OTP");
                        }
                      },
                      child: Text('Verify', style: kbutton)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didnt receive the OTP?',
                      style: GoogleFonts.inter(fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child:  Text(
                          'Resend it',
                          style: TextStyle(fontSize: 16.sp, color: Colors.black),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
