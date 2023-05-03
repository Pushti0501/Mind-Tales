
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_tales/screens/JournalScreen.dart';
import 'package:mind_tales/screens/MeditationScreen.dart';
import 'package:mind_tales/screens/PodcastScreen.dart';
import 'package:mind_tales/screens/WelcomeScreen.dart';
import 'package:mind_tales/screens/YogaScreen.dart';
import 'package:mind_tales/utils/Consultant.dart';
import 'package:mind_tales/utils/Quotes.dart';
import 'package:mind_tales/utils/Recommendations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ConsultScreen.dart';
import 'ProfileScreen.dart';
import 'SelfCareScreen.dart';

class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String username;
  late String emailId;
  final screens = [
    HomeScreen(),
    const SelfCareScreen(),
   ConsultantModule(),
    const ProfileScreen(),
  ];
  int currentindex = 0;
  TextEditingController searchController = TextEditingController();
   String _name = '';
    String _email = '';
     String uid = "";
     String profile_photo="abc";
     
   
  final FirebaseAuth auth = FirebaseAuth.instance;


// void initialize() async{
//  var document = await FirebaseFirestore.instance.collection('users').where('contactnumber',isEqualTo: '9879870536').get();
//   print(document);
// }
 getuid() async {
    final User? user = auth.currentUser;
    print(user?.uid);
        setState(() {
          uid = user!.uid;
        });
  }

  @override
  void initState(){
    super.initState();
        // getuid();
        _loadUserData();
  
   
  }

  // initUser() async {
  //   user = _auth.currentUser!;
  //   setState(() {});
  //   print(user);
  // }
  
Future<void> _loadUserData() async {

  }
  @override
  Widget build(BuildContext context) {
  
  
             return Scaffold(
        
        backgroundColor: Theme.of(context).primaryColor,
        drawer: SafeArea(
          child:Drawer(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xFF3F7C88),
                  ), //BoxDecoration
                  child: Row(
                    children: [
                      profile_photo == 'abc'?
                      CircleAvatar(
                        radius: 32.0.r,
                        
                        backgroundImage: const AssetImage("images/user.png"),
                      ): CircleAvatar(
                        radius: 32.0.r,
                        
                        backgroundImage: NetworkImage(profile_photo)
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          _name,
                         
                            style: GoogleFonts.inter(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            
                            _email.length >= 20 ?  _email.replaceRange(20, _email.length, '...'):_email,
                            maxLines: 1,
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ), //UserAccountDrawerHeader
                ), //DrawerHeader
                 ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('My Profile'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen(),));
                  },
                ),
    
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text('Journal'),
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const JournalScreen()));
                  },
                ),
                 ListTile(
                  leading: SvgPicture.asset("images/icons/yoga.svg",height:28.h,width:30.w,color: Colors.grey.shade600,),
                  title: const Text('Yoga'),
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const YogaScreen()));
                  },
                ),
                 ListTile(
                  leading: SvgPicture.asset("images/icons/meditation.svg",height:25.h,width:25.w,color: Colors.grey.shade600,),
                  title: const Text('Meditation'),
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const MeditationScreen()));
                  },
                ),
                  ListTile(
                  leading: const Icon(Icons.mic),
                  title: const Text('Podcast'),
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const PodcastScreen()));
                  },
                ),
              
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('LogOut'),
                  onTap: () {
                  auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const WelcomeScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: (currentindex == 0)?AppBar(
          
          automaticallyImplyLeading: false,
          elevation: 3.0,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  size: 30.sp,
                  color: Colors.black,
                ));
          }),
          backgroundColor: Theme.of(context).primaryColor,
         
        ):null,
        body: (currentindex == 0)?
             SingleChildScrollView(
                padding: const EdgeInsets.all(10.0),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Quote of the day',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.inter(
                              fontSize: 18.0.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    const Quote(),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Recommended for you',
                          style: GoogleFonts.inter(
                              fontSize: 18.0.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    const Recommendations(),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Consult',
                          style: GoogleFonts.inter(
                              fontSize: 18.0.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    ConsultantInfo(),
                   
                  ],
                ),
              )
            : screens[currentindex],
        bottomNavigationBar: currentindex==3?null:SizedBox(
          height:63.h,
          
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: true,
            iconSize: 40.sp,
          
            selectedLabelStyle: GoogleFonts.inter(fontSize:14.sp,fontWeight:FontWeight.w600),
            currentIndex: currentindex,
            onTap: ((value) {
              setState(() {
                currentindex = value;
              });
            }),
            items:[
               BottomNavigationBarItem(
                icon: SvgPicture.asset("images/icons/homeicon.svg",
                        height:30.h,width:30.w  ),
                label: 'Home',
                backgroundColor: Theme.of(context).primaryColorDark,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("images/icons/self_care.svg",
                        height:30.h,width:30.w  ),
                label: 'Self Care',
               
                backgroundColor: Theme.of(context).primaryColorDark,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("images/icons/Therapy.svg",
                         height:30.h,width:30.w ),
                label: 'Consult',
                backgroundColor: Theme.of(context).primaryColorDark,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("images/icons/profileicon.svg",
                        height:30.h,width:30.w ),
                label: 'Profile',
                backgroundColor: Theme.of(context).primaryColorDark,
              ),
            ],
          ),
        ),
      );
        }
   
    
  }

