import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


final kHeading =  TextStyle(
  fontSize: 25.0.sp,
  fontWeight: FontWeight.bold,
);

final kSubHeading = TextStyle(
  fontSize: 16.0.sp,
);

final kbutton =
     TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500);

final kskipbutton =
     TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600);
const kdecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF3F7C88),
    ),
  ),
);


