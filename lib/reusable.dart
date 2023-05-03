import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_tales/constants.dart';

class OnBoardingContainer extends StatelessWidget {
  late final String img;
  late final String title;
  late final String description;
 
   OnBoardingContainer(
      {required this.img, required this.title, required this.description});
      void onNavigate(){
        
      }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Image(image: AssetImage(img))),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            title,
            style: kHeading,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          child: Text(description,
              textAlign: TextAlign.center, style: kSubHeading),
        ),
      ],
    );
  }
}

class Emojicontainer extends StatefulWidget {
  final String mood;
   final bool select;
 
   Emojicontainer({required this.mood,required this.select});

  @override
  State<Emojicontainer> createState() => _EmojicontainerState();
}

class _EmojicontainerState extends State<Emojicontainer> {
  bool clicked =false;
 
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 69.h,
        width: 55.w,
      margin: const EdgeInsets.only(right:14).w,
        decoration: BoxDecoration(
          color:widget.select?Colors.grey.shade300:Colors.white,
            borderRadius: BorderRadius.circular(10.0).r,
            border: Border.all(color: widget.select?Colors.grey:Theme.of(context).primaryColorDark)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 14).r,
          child: Image(
            image: AssetImage(widget.mood),
            height:41.h,
            width:41.w,
          
          ),
        ));
      
  }
}

class SelfCareModules extends StatelessWidget {
  final String img;
  final String title;
  SelfCareModules({required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(img,
              height: 150.h,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover),
        ),
        Container(
         
           decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(5.r),bottomRight: Radius.circular(5.r)),
             color: Colors.black38,
           ),
           
          
          height: 37.h,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ],
    );
  }
}
