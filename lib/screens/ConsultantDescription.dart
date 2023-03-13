import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ConsultantDescription extends StatefulWidget {
  const ConsultantDescription({super.key});

  @override
  State<ConsultantDescription> createState() => _ConsultantDescriptionState();
}

class _ConsultantDescriptionState extends State<ConsultantDescription> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(alignment: Alignment.topLeft, children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25.sp,
                  )),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                child: Image.network(
                    "https://images.unsplash.com/photo-1622902046580-2b47f47f5471?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
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
                        "Dr. Pushti Shah",
                        style: GoogleFonts.inter(
                            fontSize: 22.sp, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Color(0xFFF1C40F),
                            size: 24.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "4.9",
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
                        "M.B.B.S. DNB Psychiatry",
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
                        "2+ Years of Experience",
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
                        "M.B.B.S. DNB Psychiatry",
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
                        "2+ Years of Experience",
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
                        "2+ Years of Experience",
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
                  SizedBox(height:10.h),
                  Text(
                      "Dr. Hetang Patel, M.B.B.S. DNB Psychiatry, is a compassionate and skilled psychiatrist who provides personalized and effective treatment options to help patients manage mental health disorders and improve their overall well-being. They are committed to ongoing education and staying up-to-date with the latest advancements in the field.",
                      style: GoogleFonts.inter(
                          fontSize: 16.sp, fontWeight: FontWeight.w400))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
