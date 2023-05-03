import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mind_tales/models/models.dart';
import 'package:mind_tales/screens/ConsultScreen.dart';
import 'package:mind_tales/utils/Consultant.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../constants.dart';

class ConsultantDescription extends StatefulWidget {
  String name;
  String description;
  String location;
  String contact;
  String email;
  String availablity;
  int fees;
  String rating;
  String urlavatar;
  String experience;
  String department;
  ConsultantDescription(
      {required this.name,
      required this.description,
      required this.location,
      required this.availablity,
      required this.contact,
      required this.email,
      required this.experience,
      required this.fees,
      required this.rating,
      required this.urlavatar,
      required this.department});

  @override
  State<ConsultantDescription> createState() => _ConsultantDescriptionState();
}

class _ConsultantDescriptionState extends State<ConsultantDescription> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
               children: [
             
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                child: Image.network(widget.urlavatar,
                    height: 261.h,
                    width: double.infinity,
                    fit: BoxFit.fitHeight),
              ),
            ]),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.name,
                        style: GoogleFonts.inter(
                            fontSize: 22.sp, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: const Color(0xFFF1C40F),
                            size: 24.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            widget.rating,
                            style: GoogleFonts.inter(
                                fontSize: 18.sp, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SvgPicture.asset("images/icons/mdi_doctor.svg"),
                      SizedBox(width: 6.w),
                      Text(
                        widget.department,
                        style: GoogleFonts.inter(
                            fontSize: 13.sp, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      SvgPicture.asset("images/icons/medal.svg"),
                      SizedBox(width: 6.w),
                      Text(
                        widget.experience,
                        style: GoogleFonts.inter(
                            fontSize: 13.sp, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 26.h),
                  Row(
                    children: [
                      Text("Contact Details",
                          style: GoogleFonts.inter(
                              fontSize: 18.sp, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SvgPicture.asset("images/icons/call.svg"),
                      SizedBox(width: 10.w),
                      Text(
                        widget.department,
                        style: GoogleFonts.inter(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      SvgPicture.asset("images/icons/mail.svg"),
                      SizedBox(width: 10.w),
                      Text(
                        widget.experience,
                        style: GoogleFonts.inter(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      SvgPicture.asset("images/icons/location.svg"),
                      SizedBox(width: 10.w),
                      Text(
                        widget.experience,
                        style: GoogleFonts.inter(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 26.h),
                  Row(
                    children: [
                      Text("About Doctor",
                          style: GoogleFonts.inter(
                              fontSize: 18.sp, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(widget.description,
                      style: GoogleFonts.inter(
                          fontSize: 14.sp, fontWeight: FontWeight.w400)),
                  //              StickyHeader(
                  // header: Container(
                  //   height: 100.0,
                  //   color: Colors.blue,
                  // ),),
                  SizedBox(height:20.h),
                 
                ],
              ),
            ),
             Container(
                    height: 82.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                          boxShadow: [
     BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 5,
        offset: Offset(-5, -5), // negative values for top and left
      ),
    
    ],
                       ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                          Text(
                            NumberFormat.simpleCurrency(
                                    locale: 'hi-IN', decimalDigits: 0)
                                .format(widget.fees),
                            style: GoogleFonts.inter(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 5.h,),
                          Text(
                            'Availability: ' + widget.availablity,
                            style: GoogleFonts.inter(
                                fontSize: 12.sp, fontWeight: FontWeight.w400),
                          ),
                                                ],
                                              ),
                                              Spacer(),
                                              Container(
                                                height: 52.h,
                                                width: 144.w,
                                                decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.circular(30.0),
                                                ),
                                                child: Center(
                            child: InkWell(
                          onTap: () {
                             showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20.0)), //this right here
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("images/tickmark.png",
                                                height: 50, width: 50),
                                            const SizedBox(height: 20),
                                            const Text(
                                              "Appointment Booked Successfully",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            const SizedBox(height: 20),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: TextButton.styleFrom(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 16),
                                                  textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  shape: StadiumBorder(),
                                                  backgroundColor:
                                                      Color(0xff23AA49),
                                                ),
                                                child: Text("OK")),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                                                 
                          },
                          child: Text(
                            'Book Now',
                            style: kbutton,
                          ),
                                                )),
                                              ),],),
                        ),
                  )
          ]),
        ),
      ),
    );
  }
}


