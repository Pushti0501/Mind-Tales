import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mind_tales/screens/JournalScreen.dart';

class WritingJournal extends StatefulWidget {
  const WritingJournal({super.key});

  @override
  State<WritingJournal> createState() => _WritingJournalState();
}

class _WritingJournalState extends State<WritingJournal> {
  TextEditingController titlecontroller=TextEditingController();
   TextEditingController descriptioncontroller=TextEditingController();
   DateTime date = DateTime.now();
   String formateddate=DateFormat.MMMd().format(DateTime.now());
   final auth=FirebaseAuth.instance;
 

   
@override
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        appBar:AppBar(
        
      leading:IconButton( icon:const Icon(Icons.arrow_back,color: Colors.black,size: 30,), onPressed: () { Navigator.of(context).pop(); },),
        automaticallyImplyLeading:false ,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Journal",style: GoogleFonts.inter(fontSize: 20.sp,color:Colors.black,fontWeight: FontWeight.w500),),
      ),
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height:10.h),
              Row(
                children: [
                  Text(formateddate,style: GoogleFonts.inter(fontSize: 25.sp,fontWeight: FontWeight.w600,),),
                  const Spacer(),
                  Container(
                    height: 35.h,
                    width:75.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Theme.of(context) .primaryColorDark                   ),
                    child: MaterialButton(onPressed: () async{
                         await FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid).collection('journal').add({
                          'title':titlecontroller.text,
                          'description':descriptioncontroller.text,
                      
                          'date':date.toString().split(' ')[0]
                         });
                          Fluttertoast.showToast(msg: "Data added");
                         // ignore: use_build_context_synchronously
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const JournalScreen(),
                            ));
                    },
                    child: Text("Save",style: GoogleFonts.inter(fontSize: 16.sp,color: Colors.white)),),
                  )
                ],
              ),
              SizedBox(height:15.h),
              SizedBox(
                
                width:360.w,
                child: TextField(
                  controller: titlecontroller,
                  minLines: 1,
                  maxLines: 1,
                
                  decoration: const InputDecoration(
                    
                    hintText: "Title",
                    border: OutlineInputBorder(
                      
                    )
                    
                  ),
                ),
              ),
              SizedBox(height:10.h),
              TextField(
                controller: descriptioncontroller,
               minLines: 1,
              maxLines: 5000,
               
                decoration: const InputDecoration(
                  hintText: "Write about your day...",
                 border: InputBorder.none,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}