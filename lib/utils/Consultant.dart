import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mind_tales/constants.dart';
import 'package:mind_tales/screens/ConsultantDescription.dart';
import 'package:mind_tales/utils/Recommendations.dart';

import '../models/models.dart';

class ConsultantInfo extends StatefulWidget {
  @override
  State<ConsultantInfo> createState() => _ConsultantInfoState();
}

class _ConsultantInfoState extends State<ConsultantInfo> {
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
        email: "abc@gmail.com",
      contact: "9876543219",
      location: "California",
      description: "Dr. Bhaumik Parikh obtained his medical degree from a prestigious institution and completed his psychiatry residency program where he received advanced training in various areas of mental health. He has also pursued additional education and training in specialized areas of psychiatry, including geriatric psychiatry and mood disorders."

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
        email: "abc@gmail.com",
      contact: "9876543219",
      location: "California",
      description: "Dr. Bhaumik Parikh obtained his medical degree from a prestigious institution and completed his psychiatry residency program where he received advanced training in various areas of mental health. He has also pursued additional education and training in specialized areas of psychiatry, including geriatric psychiatry and mood disorders."
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
        email: "abc@gmail.com",
      contact: "9876543219",
      location: "California",
      description: "Dr. Bhaumik Parikh obtained his medical degree from a prestigious institution and completed his psychiatry residency program where he received advanced training in various areas of mental health. He has also pursued additional education and training in specialized areas of psychiatry, including geriatric psychiatry and mood disorders."
    ),
    // Consultant(
    //   name: 'Dr. Jay Thummar',
    //   department: 'M.B.B.S DNB Psychiatry',
    //   experience: '2+ Years of Experience',
    //   urlavatar:"https://images.unsplash.com/photo-1480429370139-e0132c086e2a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80",
    //   rating: "4.9",
    //   fees: 1500,
    //   availablity: "9am to 3pm",
    //     email: "abc@gmail.com",
    //   contact: "9876543219",
    //   location: "California",
    //   description: "Dr. Bhaumik Parikh obtained his medical degree from a prestigious institution and completed his psychiatry residency program where he received advanced training in various areas of mental health. He has also pursued additional education and training in specialized areas of psychiatry, including geriatric psychiatry and mood disorders."
    // ),
    Consultant(
      name: 'Dr. Nishant Patel',
      department: 'M.B.B.S DNB Psychiatry',
      experience: '4+ Years of Experience',
      urlavatar:
          'https://images.unsplash.com/photo-1584043720379-b56cd9199c94?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
      rating: "4.9",
      fees: 2000,
      availablity: "9am to 5pm",
        email: "abc@gmail.com",
      contact: "9876543219",
      location: "California",
      description: "Dr. Bhaumik Parikh obtained his medical degree from a prestigious institution and completed his psychiatry residency program where he received advanced training in various areas of mental health. He has also pursued additional education and training in specialized areas of psychiatry, including geriatric psychiatry and mood disorders."
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
        email: "abc@gmail.com",
      contact: "9876543219",
      location: "California",
      description: "Dr. Bhaumik Parikh obtained his medical degree from a prestigious institution and completed his psychiatry residency program where he received advanced training in various areas of mental health. He has also pursued additional education and training in specialized areas of psychiatry, including geriatric psychiatry and mood disorders."
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
        email: "abc@gmail.com",
      contact: "9876543219",
      location: "California",
      description: "Dr. Bhaumik Parikh obtained his medical degree from a prestigious institution and completed his psychiatry residency program where he received advanced training in various areas of mental health. He has also pursued additional education and training in specialized areas of psychiatry, including geriatric psychiatry and mood disorders."
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
        email: "abc@gmail.com",
      contact: "9876543219",
      location: "California",
      description: "Dr. Bhaumik Parikh obtained his medical degree from a prestigious institution and completed his psychiatry residency program where he received advanced training in various areas of mental health. He has also pursued additional education and training in specialized areas of psychiatry, including geriatric psychiatry and mood disorders."
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: consultants.length,
        itemBuilder: (BuildContext context, int index) {
          final consultant = consultants[index];
          return Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            margin: EdgeInsets.symmetric(horizontal: 5).r,
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
                  padding: const EdgeInsets.only(left: 20.0, top: 8, right: 20),
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
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>ConsultantDescription(name:consultant.name, description: consultant.description, location: consultant.location, availablity: consultant.availablity, contact: consultant.contact, email: consultant.email, experience: consultant.experience, fees: consultant.fees, rating: consultant.rating, urlavatar: consultant.urlavatar, department: consultant.department)));
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
    );
    // body:Container(
    //   height:120.0,
    //   child:ListView.builder(
    // scrollDirection: Axis.horizontal,
    // itemCount: consultants.length,
    // itemBuilder: (context, index) {
    //   final consultant = consultants[index];
    //   return Card(
    //         child: ListTile(
    //       leading: CircleAvatar(
    //         radius: 25,
    //         backgroundImage: NetworkImage(consultant.urlavatar),
    //       ),
    //       title: Text(consultant.name),
    //       subtitle: Column(
    //         children: [
    //           Text(consultant.department),
    //           Text(consultant.experience),
    //         ],

    //     )),
    //   );
    // }),),
  }
}
