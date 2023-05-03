import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_tales/screens/HomeScreen.dart';
import 'package:mind_tales/screens/WelcomeScreen.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController contactnumbercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String imageUrl = 'abc';
  String? profile_photo = "";
  String? _newPassword = '';

  _getFromGallery() async {
    PickedFile? image = await _picker.getImage(source: ImageSource.gallery);
    var file = File(image!.path);

    if (image != null) {
      print(_auth.currentUser!.uid);
      var snapshot = await _storage
          .ref('ProfilePhoto/' + _auth.currentUser!.uid)
          .putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();

      print('downloadUrl $downloadUrl');
      setState(() {
        imageUrl = downloadUrl;
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'profile_photo': downloadUrl});
    }
    if (image != null) {
      File imageFile = File(image.path);
      print(imageFile);
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  Future ImageUpload() async {
    // ignore: deprecated_member_use
    PickedFile? image = await _picker.getImage(source: ImageSource.gallery);
    _imageFile = File(image!.path);
    print(image);
  }

  Future<void> _loadUserData() async {
    final documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((ds) => {
              setState(() {
                namecontroller.text = ds.data()?['username'];
                emailcontroller.text = ds.data()?['email'];
                passwordcontroller.text = ds.data()?['password'];
                contactnumbercontroller.text = ds.data()?['contactnumber'];
                profile_photo = ds.data()!['profile_photo'];
              })
            });
          
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
 
    //  Provider.of<UserData>(context).getdata();
    //  print("--------------"+FirebaseAuth.instance.currentUser!.uid);
  }

  Future<void> saveChanges() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'username': namecontroller.text,
      'email': emailcontroller.text,
      // 'password': passwordcontroller.text,
      'contactnumber': contactnumbercontroller.text,
    }).then((value) => {
     
      _loadUserData()
    });

    Fluttertoast.showToast(msg: "Data added");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, value, Widget? child) {
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              "Profile",
              style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              // ignore: sort_child_properties_last
              child: Column(children: [
                SizedBox(height: 46.h),
                Stack(
                  children: [
                    imageUrl == 'abc'
                        ? profile_photo == "abc" || profile_photo == ""
                            ? CircleAvatar(
                                radius: 65.0.r,
                                backgroundColor: Colors.white38,
                                backgroundImage:
                                    const AssetImage("images/user.png"),
                              )
                            : CircleAvatar(
                                radius: 65.0.r,
                                backgroundImage: NetworkImage(profile_photo!),
                                // backgroundImage: FileImage(File(_imageFile!.path)),
                              )
                        : CircleAvatar(
                            radius: 65.0.r,
                            backgroundImage: FileImage(File(_imageFile!.path)),
                          ),
                    Positioned(
                        bottom: 1.sp,
                        left: 90.sp,
                        child: InkWell(
                            onTap: () {
                              _getFromGallery();
                            },
                            child: SvgPicture.asset("images/icons/camera.svg",
                                height: 33.h, width: 33.w))),
                  ],
                ),
                SizedBox(
                  height: 28.h,
                ),
                TextField(
                  
                  controller: namecontroller,
                  decoration: InputDecoration(
                  
                    labelText: "Name",
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                    labelText: "Email ID",
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  controller: contactnumbercontroller,
                  decoration: const InputDecoration(
                    labelText: "Contact number",
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Stack(
                  children: [
                    TextField(
                      obscureText: true,
                      controller: passwordcontroller,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                    ),
                    Positioned(
                        top: 15,
                        right: 5,
                        child: TextButton(
                            onPressed: () async {
                              auth.sendPasswordResetEmail(
                                  email: emailcontroller.text);
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('Password Reset Email Sent'),
                                  content: Text(
                                      'Please check your email to reset your password.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              "Update Password",
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.black),
                            )))
                  ],
                ),
                SizedBox(
                  height: 47.h,
                ),
                MaterialButton(
                  padding: const EdgeInsets.all(18),
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0.r),
                  ),
                  color: Theme.of(context).primaryColorDark,
                  onPressed: () {
                    saveChanges();
                  },
                  child: Text(
                    'Save Changes',
                    style: kbutton,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                MaterialButton(
                  padding: const EdgeInsets.all(18),
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0.r),
                  ),
                  color: Theme.of(context).primaryColorDark,
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ));
                  },
                  child: Text(
                    'Sign Out',
                    style: kbutton,
                  ),
                ),
              ]),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            ),
          ),
        );
      },
    );
  }
}
