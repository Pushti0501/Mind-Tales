import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mind_tales/constants.dart';
import 'package:mind_tales/screens/LoginScreen.dart';
import 'package:mind_tales/screens/SignUpScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                // color: Colors.blue,

                height: MediaQuery.of(context).size.height * 0.48,
                child: Lottie.asset('assets/welcomelogo.json'),
              ),
              Text(
                'Welcome to',
                style: GoogleFonts.inter(
                    fontSize: 36.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //   Text(
              //     'Welcome to',
              //     style: GoogleFonts.inter(fontSize: 36, fontWeight: FontWeight.w700),
              //   ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mind',
                    style: GoogleFonts.inriaSerif(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColorDark),
                  ),
                  Text('Tales',
                      style: GoogleFonts.inriaSerif(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
              SizedBox(
                height: 20.0.h,
              ),
              Text(
                'A Place to feel peace.',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 53.0.h,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16).r,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(25.0.r),
                ),
                child:  MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                      },
                      child: Text('Sign Up', style: kbutton)),
                
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.inter(fontSize: 16.sp),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
