import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_tales/screens/Description.dart';
import 'package:mind_tales/screens/WritingJournal.dart';
import 'package:table_calendar/table_calendar.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final auth = FirebaseAuth.instance;
  String uid = 'abc';
  var mood_id = 0;
  final date = DateTime.now();
  String startdate = "start";
  TextEditingController searchcontroller=TextEditingController();
  String enddate = "end";
  List mood = [
    "images/happy.png",
    "images/calm.png",
    "images/worried.png",
    "images/sad.png",
    "images/angry.png"
  ];
  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);
  getuid() async {
    final User? user = auth.currentUser;

    print(user?.uid);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((ds) => {
              setState(() {
                mood_id = ds.data()!['mood'];
              }),
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuid();
    final User? user = FirebaseAuth.instance.currentUser;

    setState(() {
      uid = user!.uid;
      startdate =
          getDate(date.subtract(Duration(days: date.weekday - 1))).toString();
      enddate =
          getDate(date.add(Duration(days: DateTime.daysPerWeek - date.weekday)))
              .toString();
    });

    print('Date: $date');
    print(
        'Start of week: ${getDate(date.subtract(Duration(days: date.weekday - 1)))}');
    print(
        'End of week: ${getDate(date.add(Duration(days: DateTime.daysPerWeek - date.weekday)))}');
  }
  
  @override
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
          title: Text(
            "Journal",
            style: GoogleFonts.inter(
                fontSize: 20.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
        reverse: false,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: Column(
                children: [
                  //  Row(
                  //   children: [
                  //     Text("Today",style:  GoogleFonts.inter(fontSize: 18.sp,color:Colors.black,fontWeight: FontWeight.w600),),
                  //     Spacer(),
                  //     Text("Thursday, 30 April",style:  GoogleFonts.inter(fontSize: 12.sp,color:Colors.black,fontWeight: FontWeight.w400),)
                  //   ],
                  // ),
                  // SizedBox(height:30.h),
                  Container(
                    width: 360.w,
                    child: TableCalendar(
                      firstDay: DateTime(2023),
                      lastDay: DateTime(2024),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      rowHeight: 60,
                      daysOfWeekHeight: 60,
                      headerStyle: const HeaderStyle(

                          // leftChevronIcon: const Icon(
                          //   Icons.arrow_back,
                          //   color: Colors.teal,
                          //   size: 28,
                          // ),
                          // rightChevronIcon: const Icon(
                          //   Icons.arrow_forward,
                          //   color: Colors.teal,
                          //   size: 28,
                          // ),
                          ),
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                            borderRadius: BorderRadius.circular(5)),
                        selectedDecoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(_selectedDay, selectedDay)) {
                          // Call `setState()` when updating the selected day ghare thi call
                          setState(() {
                            // startdate = selectedDay.toString().split(' ')[0].toString().trim();
                            enddate = getDate(selectedDay.add(Duration(
                                    days: DateTime.daysPerWeek -
                                        selectedDay.weekday)))
                                .toString()
                                .split('00')[0].toString().trim();
                            startdate = getDate(selectedDay.subtract(Duration(days: selectedDay.weekday - 1)))
                                .toString()
                                .split('00')[0].toString().trim();
                                
                            _focusedDay = focusedDay;
                          });
                        }
                      },
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          // Call `setState()` when updating calendar format
                          setState(() {
                            _calendarFormat = format;
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        // No need to call `setState()` here
                        _focusedDay = focusedDay;
                      },
                    ),
                  ),
                  Container(
                    height: 67.h,
                    width: 360.w,
                    child: Row(
                      children: [
                        Container(
                            height: 35.h,
                            width: 284.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(
                                  color: Theme.of(context).primaryColorDark,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, left: 13),
                              child: Row(
                                children: [
                                 
                                  Expanded(
                                    child: TextField(
                                      
                                        controller: searchcontroller,
                                        showCursor: true,
                                        onChanged: (value) {
                                          value=searchcontroller.text;
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Search notes",

                                          contentPadding:
                                              const EdgeInsets.all(3),
                                          hintStyle: GoogleFonts.inter(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF777777),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              borderSide: BorderSide.none),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                        )),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(width: 13.w),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WritingJournal())),
                          child: SvgPicture.asset(
                            "images/icons/Add new.svg",
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              child: StreamBuilder(
                  stream:searchcontroller.text.length>=1? 
                    FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .collection('journal')
                      .where("title", isEqualTo: searchcontroller.text)
                      .snapshots()
                   : 
                   FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .collection('journal')
                      .where("date", isLessThan: enddate.split('00')[0].toString().trim())
                      .where("date",isGreaterThanOrEqualTo: startdate.split('00')[0].toString().trim())
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SizedBox(
                          height: 50.h,
                          child: const CircularProgressIndicator(),
                        ),
                      );
                    } else {

                      print(snapshot.data);
                      final docs = snapshot.data!.docs;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: docs.length,
                          itemBuilder: ((context, index) {
                        
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder:(context) =>  Description(title: docs[index]['title'], description:docs[index]['description'],mood:mood[mood_id]), ));
                                  },
                                  child: Container(
                                    height: 82.h,
                                    width: 328.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFD6E5EB),
                                        borderRadius: BorderRadius.circular(5.r)),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 206.w,
                                          height: 61.h,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 6.w, vertical: 3.h),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(docs[index]['date'],
                                                    style: GoogleFonts.inter(
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            const Color(0xFF777777))),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Text(docs[index]['title'],
                                                    style: GoogleFonts.inter(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black)),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Text(docs[index]['description'],
                                                maxLines: 1,
                                                    style: GoogleFonts.inter(
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black))
                                              ],
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20.17, horizontal: 9.35),
                                          child: Container(
                                            height: 41.h,
                                            width: 41.w,
                                            child: Image.asset(mood[mood_id]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h)
                              ],
                            );
                          }));
                    }
                  }),
            )
          ]),
        ));
  }
}
