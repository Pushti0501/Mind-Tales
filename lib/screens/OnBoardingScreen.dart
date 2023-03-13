import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_tales/constants.dart';
import 'package:mind_tales/reusable.dart';
import 'package:mind_tales/screens/WelcomeScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                children: [
                  OnBoardingContainer(
                      img: 'images/meditation.png',
                      title: 'Escape the Chaos',
                      description:
                          'With the assistance of our soothing meditation sessions, find serenity and peace amidst the chaos.'),
                  OnBoardingContainer(
                      img: 'images/yoga.png',
                      title: 'Small Victories',
                      description:
                          'As anxiety serves no purpose, learn to practice yoga and reduce stress hormones while boosting your feel-good hormones.'),
                  OnBoardingContainer(
                      img: 'images/self_care.png',
                      title: 'Self Care Routine',
                      description:
                          'Routine helps build familiarity leading to confidence, build a habit of journaling and listen to  podcast with some amazingly supporting stories'),
                ],
              ),
            ),
             SizedBox(height: 10.0.h),
            SmoothPageIndicator(
                controller: controller, // PageController
                count: 3,
                effect: ScrollingDotsEffect(
                    activeDotScale: 1.8,
                    dotWidth: 8.0,
                    dotHeight: 8.0,
                    activeDotColor: Theme.of(context)
                        .primaryColorDark), // your preferred effect
                onDotClicked: (index) {
                  controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                }),
            Container(
              margin: const EdgeInsets.all(35),
             
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 53.h,
                    width: 108.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: MaterialButton(
                        onPressed: () {
                          controller.jumpToPage(2);
                        },
                        child: Text(
                          'Skip',
                          style: kskipbutton,
                        )),
                  ),
                  Container(
                    height: 53.h,
                    width: isLastPage?128:107,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: Theme.of(context).primaryColorDark,
                    ),
                    child: isLastPage?MaterialButton(
                     
                        onPressed: () {
                         
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
                        },
                        child: Text('Get Started', style: kbutton)):
                        MaterialButton(
                         
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                           
                        },
                        child: Text('Next', style: kbutton))
                        
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
