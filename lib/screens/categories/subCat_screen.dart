import 'package:flutter/material.dart';

class SubCatList extends StatelessWidget {
  static const String id='subCat-Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: Border(bottom: BorderSide(color: Colors.grey),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Categories',style: TextStyle(color: Colors.black,),),
      ),
      body: Center(child: Text('Sub Cat'),),
    );
  }
}
