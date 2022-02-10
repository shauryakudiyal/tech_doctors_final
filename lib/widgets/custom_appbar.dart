import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tech_doctors/screens/location_screen.dart';
import 'package:tech_doctors/services/firebase_sevices.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseServices _services = FirebaseServices();
    return FutureBuilder<DocumentSnapshot>(
      future: _services.users.doc(_services.user.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Address Not Set Yet");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data.data() as Map<String, dynamic>;
          if (data['address'] == null) {
            //check next data
            GeoPoint latLang = data['location'];
            _services
                .getAddress(latLang.latitude, latLang.longitude)
                .then((address) {
              return appBar(address, context);
            });
          }
          else {
            return appBar(data['address'], context);
          }
        }

        return Text("Fetching Location...");
      },
    );
  }

  Widget appBar(address, context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: InkWell(
        onTap: () {
          Navigator.push (
            context,
            MaterialPageRoute (
              builder: (BuildContext context) => LocationScreen(locationChanging: true,),
            ),
          );
          },
        child: Container(
          child: Row(
            children: [
              Icon(Icons.location_on),
              Expanded(
                child: Text(
                  address,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              Icon(Icons.keyboard_arrow_down_rounded)
            ],
          ),
        ),
      ),
    );
//
  }
}
