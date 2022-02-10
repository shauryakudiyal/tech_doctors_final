import 'package:flutter/material.dart';
import 'package:tech_doctors/screens/chat_screen.dart';
import 'package:tech_doctors/screens/home_screen.dart';
import 'package:tech_doctors/screens/myAds_screen.dart';
import 'package:tech_doctors/screens/profile.dart';
import 'package:tech_doctors/screens/sellList/seller_category_list.dart';

class MainScreen extends StatefulWidget {
  static const String id='main-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Widget _currentScreen = HomeScreen();
  int _index = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Scaffold(
      body: PageStorage(
        child: _currentScreen,
        bucket: _bucket,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, SellerCategory.id);
        },
        elevation: 4.0,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                  minWidth: 80,
                  onPressed: (){
                  setState(() {
                    _index=0;
                    _currentScreen=HomeScreen();
                  });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(_index==0 ? Icons.home : Icons.home_outlined),
                      Text('Home',style: TextStyle(
                          color: _index==0 ? color : Colors.black,
                          fontWeight: _index==0 ? FontWeight.bold : FontWeight.normal),
                      ),
                ],
              ),
              ),
                  MaterialButton(
                    minWidth: 80,
                    onPressed: (){
                      setState(() {
                        _index=1;
                        _currentScreen=ChatScreen();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(_index==1 ? Icons.chat : Icons.chat_outlined),
                        Text('Chat',style: TextStyle(
                            color: _index==1 ? color : Colors.black,
                            fontWeight: _index==1 ? FontWeight.bold : FontWeight.normal),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
              Row(
                children: [
                  MaterialButton(
                    minWidth: 80,
                    onPressed: (){
                      setState(() {
                        _index=2;
                        _currentScreen=MyAdsScreen();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(_index==2 ? Icons.favorite : Icons.favorite_border_outlined),
                        Text('My Ads',style: TextStyle(
                            color: _index==2 ? color : Colors.black,
                            fontWeight: _index==2 ? FontWeight.bold : FontWeight.normal,
                            fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 80,
                    onPressed: (){
                      setState(() {
                        _index=3;
                        _currentScreen=ProfileScreen();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(_index==3 ? Icons.account_circle : Icons.account_circle_outlined),
                        Text('Profile',style: TextStyle(
                            color: _index==3 ? color : Colors.black,
                            fontWeight: _index==3 ? FontWeight.bold : FontWeight.normal,
                            fontSize: 12),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ],
          ),

        ),
      ),
    )
    ;
  }
}
