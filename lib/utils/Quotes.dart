import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Quote extends StatefulWidget {
  const Quote({super.key});

  @override
  State<Quote> createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  List<String> quotes = [
    'It is only in the darkest nights that stars shine more brightly.',
    'Let light shine out of darkness.',
    'Every moment is a fresh beginning.',
    'Eventually everything connects.',
    'You are smarter than you think.',
    'You are your own healer.',
    'Dont let negative thoughts win over positivity.',
    'Live in the moment, live in the breath.',
    'If their is no struggle, theirs no progress.',
    'Enjoy the journey and not only the destiny.',
    'Keep a little fire burning; however small, however hidden.',
    'Somewhere, something incredible is waiting to happen.',
    'In the middle of difficulty lies opportunity.',
    'You never fail until you stop trying.',
    'Fear kills more dreams, then failure will ever do.',
    'Every day is a chance to be better.',
    'Believe in yourself and everything falls in place.',
    'Hold the vision, trust the process.',
    'Nothing can be done without hope and confidence.'
  ];
  List<String>backgroundimges = [
  'https://images.unsplash.com/photo-1474418397713-7ede21d49118?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bWVkaXRhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1522075782449-e45a34f1ddfb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
 'https://media.istockphoto.com/id/1391404962/photo/pyramid-stones-balance-on-old-mossy-fallen-tree.jpg?b=1&s=170667a&w=0&k=20&c=k-eIZWcTHtTvcBCUlckZ4Q6wo5iPJKphu-iPfs_xgjA=',
 'https://images.unsplash.com/photo-1475924156734-496f6cac6ec1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG5hdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
 'https://images.unsplash.com/photo-1490730141103-6cac27aaab94?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fG5hdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
   'https://images.unsplash.com/photo-1499946981954-e7f4b234d7fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHBlYWNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?b=1&s=170667a&w=0&k=20&c=6hCgXAzeqhu-lU1yTwe2o4rtS4jI2PVC6_MRqvOjORg=',
    'https://images.unsplash.com/photo-1469474968028-56623f02e42e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ];
  final _random = new Random();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
              backgroundimges[_random.nextInt(backgroundimges.length)],
              height: 170.h,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black38,
          ),
          height: 170.h,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(quotes[_random.nextInt(quotes.length)],
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18.0.sp,
                )),
                
          ),
        ),
      ],
    );
  }
}
