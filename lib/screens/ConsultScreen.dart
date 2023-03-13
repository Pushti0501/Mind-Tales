import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mind_tales/constants.dart';
import 'package:mind_tales/screens/ConsultantDEscription.dart';
import 'package:mind_tales/utils/Recommendations.dart';

import '../models/models.dart';

class ConsultantModule extends StatefulWidget {
  @override
  State<ConsultantModule> createState() => _ConsultantModuleState();
}

class _ConsultantModuleState extends State<ConsultantModule> {
  List<Consultant> consultants = [
    Consultant(
      name: 'Dr. Claudia Francis',
      department: 'M.B.B.S DNB Psychiatry',
      experience: '3+ Years of Experience',
      urlavatar:
          'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      rating: "4.8",
      fees: 2000,
      availablity: "7am to 12pm",
    ),
    Consultant(
      department: 'M.B.B.S DNB Psychiatry',
      name: 'Dr. Smit Patel',
      experience: '2+ Years of Experience',
      urlavatar:
          'https://images.unsplash.com/photo-1537368910025-700350fe46c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      rating: "4.9",
      fees: 1700,
      availablity: "9am to 1pm",
    ),
    Consultant(
      name: 'Dr. Vikram Patel',
      department: 'M.B.B.S DNB Psychiatry',
      experience: '1+ Years of Experience',
      urlavatar:
          'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      rating: "4.7",
      fees: 950,
      availablity: "10am to 3pm",
    ),
    Consultant(
      name: 'Dr. Jay Thummar',
      department: 'M.B.B.S DNB Psychiatry',
      experience: '2+ Years of Experience',
      urlavatar:
          'https://images.unsplash.com/photo-1622902046580-2b47f47f5471?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      rating: "4.9",
      fees: 1500,
      availablity: "9am to 3pm",
    ),
    Consultant(
      name: 'Dr. Nishant Patel',
      department: 'M.B.B.S DNB Psychiatry',
      experience: '4+ Years of Experience',
      urlavatar:
          'https://images.unsplash.com/photo-1584043720379-b56cd9199c94?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
      rating: "4.9",
      fees: 2000,
      availablity: "9am to 5pm",
    ),
    Consultant(
      name: 'Dr. Hasti Bhalodiya',
      department: 'M.B.B.S DNB Psychiatry',
      experience: '4+ Years of Experience',
      urlavatar:
          'https://media.istockphoto.com/id/1398994132/photo/happy-businesswoman-using-a-digital-tablet-young-leading-businesswoman-using-a-wireless.jpg?b=1&s=170667a&w=0&k=20&c=z-tvJG0r-SNUrIGwZb7YjLI9f_cOnkN30vcPafskrkQ=',
      rating: "4.5",
      fees: 1000,
      availablity: "8am to 3pm",
    ),
    Consultant(
      name: 'Dr. Bhaumik Parikh',
      department: 'M.B.B.S DNB Psychiatry',
      experience: '1+ Years of Experience',
      urlavatar:
          'https://images.unsplash.com/photo-1556157382-97eda2d62296?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      rating: "4.6",
      fees: 990,
      availablity: "9am to 3pm",
    ),
    Consultant(
      name: 'Dr. Hina Shah',
      department: 'M.B.B.S DNB Psychiatry',
      experience: '4+ Years of Experience',
      urlavatar:
          'https://plus.unsplash.com/premium_photo-1661475871391-cc7652c61b4a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGZlbWFsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1000&q=60',
      rating: "4.9",
      fees: 2500,
      availablity: "7am to 2pm",
    ),
  ];
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
          "Consultant",
          style: GoogleFonts.inter(
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: consultants.length,
          itemBuilder: (BuildContext context, int index) {
            final consultant = consultants[index];
            return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              margin: EdgeInsets.all(8),
              height: 154.h,
              width: 333.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                color: Color(0xFFD2E7EE),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(3),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30.r,
                        backgroundImage: NetworkImage(consultant.urlavatar),
                      ),
                      title: Stack(children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFF1C40F),
                                  size: 20.sp,
                                ),
                                Text(
                                  consultant.rating,
                                  style: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  consultant.name,
                                  style: GoogleFonts.inter(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  consultant.department,
                                  style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  consultant.experience,
                                  style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                  Divider(
                    thickness: 1.0.h,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 8, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.simpleCurrency(
                                      locale: 'hi-IN', decimalDigits: 0)
                                  .format(consultant.fees),
                              style: GoogleFonts.inter(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Availability: ' + consultant.availablity,
                              style: GoogleFonts.inter(
                                  fontSize: 14.sp, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 36.h,
                          width: 117.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ConsultantDescription()));
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return Dialog(
                              //         shape: RoundedRectangleBorder(
                              //             borderRadius: BorderRadius.circular(
                              //                 20.0)), //this right here
                              //         child: Container(
                              //           height:
                              //               MediaQuery.of(context).size.height *
                              //                   0.3,
                              //           child: Padding(
                              //             padding: const EdgeInsets.all(12.0),
                              //             child: Column(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.center,
                              //               children: [
                              //                 Image.asset("images/tickmark.png",
                              //                     height: 50, width: 50),
                              //                 SizedBox(height: 20),
                              //                 Text(
                              //                   "Appointment Booked Successfully",
                              //                   textAlign: TextAlign.center,
                              //                   style: TextStyle(fontSize: 25),
                              //                 ),
                              //                 SizedBox(height: 20),
                              //                 ElevatedButton(
                              //                     onPressed: () {
                              //                       Navigator.of(context).pop();
                              //                     },
                              //                     style: TextButton.styleFrom(
                              //                       padding: const EdgeInsets
                              //                               .symmetric(
                              //                           vertical: 16),
                              //                       textStyle: TextStyle(
                              //                           fontSize: 14,
                              //                           fontWeight:
                              //                               FontWeight.w500),
                              //                       shape: StadiumBorder(),
                              //                       backgroundColor:
                              //                           Color(0xff23AA49),
                              //                     ),
                              //                     child: Text("OK")),
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       );
                              //     });
                            },
                            child: Text(
                              'Book Now',
                              style: kbutton,
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
