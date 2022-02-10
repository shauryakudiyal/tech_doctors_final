import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tech_doctors/screens/categories/subCat_screen.dart';
import 'package:tech_doctors/screens/sellList/seller_subCat_screen.dart';
import 'package:tech_doctors/services/firebase_sevices.dart';

class SellerCategory extends StatelessWidget {
  static const String id = 'seller-category-list-screen';

  @override
  Widget build(BuildContext context) {



    FirebaseServices _service = FirebaseServices();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: Border(bottom: BorderSide(color: Colors.grey),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Choose Categories',style: TextStyle(color: Colors.black,),),
      ),
        body: Container(
          child: FutureBuilder<QuerySnapshot>(
            future: _service.categories.orderBy('sortId',descending: false).get(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Container();
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(),);
              }

              return Container(
                child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      var doc = snapshot.data.docs[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: (){
                            if(doc['subCat']==null){
                              return print('no sub category');
                            }
                            Navigator.pushNamed(context, SellerSubCatList.id, arguments: doc);
                          },
                          leading: Image.network(doc['image'], width: 40,),
                          title: Text(doc['catName'],style: TextStyle(fontSize: 15),),
                          trailing: doc['subCat']==null? null : Icon(Icons.arrow_forward_ios,size: 12,),
                        ),

                      );
                    }
                ),
              );
            },
          ),
        ),

    );
  }
}
