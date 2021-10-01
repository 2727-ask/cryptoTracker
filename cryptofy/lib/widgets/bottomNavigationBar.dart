
import 'package:cryptofy/templates/chart/chartCategories.dart';

import 'package:cryptofy/templates/home/currencyDisplay.dart';
import 'package:cryptofy/templates/newsFeeds/newsCategories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';








class MyBottomNavBar extends StatefulWidget {
  

  MyBottomNavBar({Key key}) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {


  static  List<Widget> _widgetOptions = <Widget>[

    CurrencyDisplay(),
    ChartCategories(),
    NewsCategories(),

  ];


  int atIndex=0;
  void onTapColor(int index) {
    setState(() {
      atIndex = index;  
    });
  }

  @override
  void initState() { 



    super.initState();
    
  }


  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body:_widgetOptions.elementAt(atIndex),
        bottomNavigationBar: SizedBox(
          height:50,
          child: BottomNavigationBar(
            
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home,size:20,),
              label: 'Home',
              
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_bar_circle_fill,size:20),
              label: 'RealTime Charts',
            ),
            BottomNavigationBarItem(
              
              icon: Icon(CupertinoIcons.chat_bubble_text_fill,size:20),
              label: 'Feeds',

              
            ),
          ],
          currentIndex:atIndex,
          selectedItemColor: Colors.greenAccent,
          onTap:(index){
           onTapColor(index);
          }),
        ),
    );
        
  }
  
}
