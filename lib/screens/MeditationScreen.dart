import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_tales/screens/QuickandeasyScreen.dart';
import 'package:mind_tales/utils/Article_meditaion.dart';
import 'package:mind_tales/utils/QuickandEasy_rename.dart';
import 'package:mind_tales/utils/Recommendations.dart';
import 'package:mind_tales/utils/Sleepbetter_meditaion.dart';

import '../utils/Anxiety_meditation.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  bool see_all=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
       appBar:AppBar(
        
      leading:IconButton(icon:Icon(Icons.arrow_back,color: Colors.black,size: 30,), onPressed: () { Navigator.of(context).pop(); },),
        automaticallyImplyLeading:false ,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Meditation",style: GoogleFonts.inter(fontSize: 20.sp,color:Colors.black,fontWeight: FontWeight.w600),),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               
              
                Row(
                  children: [
                    Text(
                      'Quick and Easy Audio',
                      style: GoogleFonts.inter(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder:(context) => QuickandEasyScreen(),));},
                      child: Text(
                        'See all',
                        style: GoogleFonts.inter(
                            fontSize: 13.sp,color: Colors.black ,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
             
                const QuickandEasyModule(),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text(
                      'Featured Articles',
                      style: GoogleFonts.inter(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
               const Articles(),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text(
                      'Meditation for Anxiety',
                      style: GoogleFonts.inter(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                 const Anxiety(),
                 SizedBox(height: 20.h),
                Row(
                  children: [
                    Text(
                      'Sleep Better',
                      style: GoogleFonts.inter(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const Sleepbetter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
