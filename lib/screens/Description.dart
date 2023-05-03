import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class Description extends StatefulWidget {
  final String title;
  final String description;
  final String mood;
  

  Description(
      {super.key, required this.title, required this.description, required this.mood});

    @override
  State<Description> createState() => _DescriptionState();
}



class _DescriptionState extends State<Description> {
      
  @override
     






    final FirebaseAuth auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: MaterialButton(onPressed: (){


        //     },
        //     color: Theme.of(context).primaryColorDark,
        //            child: Text("Save",style: GoogleFonts.inter(fontSize: 16.sp,color: Colors.white)),
        //     ),
        //   )
          
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Expanded(
                child: Row(
                  children: [
                    Text(
                 widget.title,
                        maxLines: 1,
                        style: GoogleFonts.inter(
                            fontSize: 20.sp, fontWeight: FontWeight.bold)
                            ),
                    Spacer(),
                    Container(
                      height: 41.h,
                      width: 41.w,
                      child: Image.asset(widget.mood),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(10),
              child:  Text(
              
                 widget.description,
               style: GoogleFonts.inter(
                            fontSize: 16.sp)
                            ),
              ),
              
              // child: TextField(
              //   widget.description,
              //     style: TextStyle(
              //       fontSize: 18,
              //     )),
            
          ],
        ),
      ),
    );
  }
}
