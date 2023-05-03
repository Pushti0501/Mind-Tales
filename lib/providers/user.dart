import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserData extends ChangeNotifier{
  String name = '';
  String email="";
  String password="";
  String contactnumber="";
  String uid = "";
  String profile="";

  final _auth = FirebaseAuth.instance;
   getdata() async {
    final User? user = _auth.currentUser;
    print(user?.uid);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((ds) => {
              // ignore: avoid_print
              print(ds.data()),
             
                name = ds.data()!['username'],
                email=ds.data()!['email'],
              password=ds.data()!['password'],
              contactnumber=ds.data()!['contactnumber'],
              profile=ds.data()!['profile_photo']

              
            });
  }
  //   Future<void> _loadUserData() async {
  //   final documentSnapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get()
  //       .then((ds) => {
            
  //             print(ds.data()!['email']),
  //     namecontroller.text = ds.data()!['username'],
  //     emailcontroller.text = ds.data()!['email'],
  //     passwordcontroller.text = ds.data()!['password'],
  //     contactnumbercontroller.text = ds.data()!['contactnumber'],
  //     setState(() {
  //       profile_photo = ds.data()!['profile_photo'];
  //     })
  //           });   

  // }
}