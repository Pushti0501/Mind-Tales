import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_tales/constants.dart';

import 'package:mind_tales/reusable.dart';
import 'package:mind_tales/screens/HomeScreen.dart';

import '../models/models.dart';


class MoodTrackScreen extends StatefulWidget {
  @override
  State<MoodTrackScreen> createState() => _MoodTrackScreenState();
}

class _MoodTrackScreenState extends State<MoodTrackScreen> {
  String _name = '';
  String uid = "";
  bool clicked = false;
  final _auth = FirebaseAuth.instance;
  List mood = [
    Mood(url: "images/happy.png", isSelect: false),
    Mood(url: "images/calm.png", isSelect: false),
    Mood(url: "images/worried.png", isSelect: false),
    Mood(url: "images/angry.png", isSelect: false),
    Mood(url: "images/sad.png", isSelect: false),
  ];

  getuid() async {
    final User? user = _auth.currentUser;
    print(user?.uid);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((ds) => {
              print(ds.data()!['username']),
              setState(() {
                uid = user!.uid;
                _name = ds.data()!['username'];
              }),
            });
  }

  @override
  void initState() {
    super.initState();
    getuid();
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height:30.h),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: const Image(image: AssetImage('images/Mood.png')),
                  ),
                  Text(
                    'Hello' + " " + _name,
                    style: GoogleFonts.inter(
                        fontSize: 30.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 7.0.h,
                  ),
                  Text(
                    'How are you feeling today?',
                    style: GoogleFonts.inter(
                        fontSize: 20.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 31.0.sp,
                  ),
                  Container(
                    width: double.infinity,
                    height: 70.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mood.length,
                        itemBuilder: (context, index) {
                          final moods=mood[index];
                          return InkWell(
                              onTap: () {
                                clicked = true;
                               //moods.isSelect=true;
                               setState(() {
                                   mood.forEach(
                                        (mood) => mood.isSelect = false);
                                        moods.isSelect=true;
                               });
                              },
                              child: Emojicontainer(
                                mood: moods.url,
                                select: moods.isSelect,
                                
                              ));
                        }),
                  ),
                  SizedBox(height: 42.h),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    // margin: EdgeInsets.only(right:11,left: 11),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(30.0.r),
                    ),
                    child: MaterialButton(
                    
                        onPressed: () async{
                          if (clicked == true) {
                           for (var i = 0; i < mood.length; i++) {
                             if (mood[i].isSelect == true) {
                               print(i);
                             await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
     'mood': i
    });
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                             }
                           }

                          } else {
                            Fluttertoast.showToast(
                                msg: "Please select the mood");
                          }
                        },
                        child: Text('Next', style: kbutton)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
