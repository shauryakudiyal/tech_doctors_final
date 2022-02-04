import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:tech_doctors/screens/location_screen.dart';
import 'package:tech_doctors/screens/login_screen.dart';
import 'package:tech_doctors/widgets/banner.dart';
import 'package:tech_doctors/widgets/categories_widget.dart';
import 'package:tech_doctors/widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home-screen';


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String address = 'India';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: SafeArea(child: CustomAppBar(),),
      ),
      body: Column(
        children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12,10,12,8),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search,),
                                  labelText: 'Search Service Centre',
                                  contentPadding: EdgeInsets.only(left: 10,right: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)
                                  )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.notifications_none),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
            child: Column(
              children: [
                BannerWidget(),
                CategoryWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
