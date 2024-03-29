import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:tech_doctors/screens/home_screen.dart';
import 'package:tech_doctors/screens/main_screen.dart';

class FirebaseServices{

  User user=FirebaseAuth.instance.currentUser;

  CollectionReference users=FirebaseFirestore.instance.collection('users');
  CollectionReference categories=FirebaseFirestore.instance.collection('categories');

  Future<void> updateUser(Map<String,dynamic>data,context) {
    return users
        .doc(user.uid)
        .update(data)
        .then((value) => Navigator.pushReplacementNamed(context, MainScreen.id))
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to Update Data'),
        ),
      );
    });
  }
 Future<String> getAddress(lat,long)async{
   final coordinates = new Coordinates(lat, long);
   var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
   var  first = addresses.first;
   return first.addressLine;
 }
 Future<DocumentSnapshot>getUserData()async{
    DocumentSnapshot doc = await users.doc(user.uid).get();
    return doc;
 }
}