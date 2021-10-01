import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      DrawerHeader(
          child: Container(
              margin: EdgeInsets.only(top: 50),
              child: ShimmerText(
                text: 'CryptoTracker',
                fontsize: 30,
                baseColor: Colors.pink,
                highlightedColor: Colors.blueAccent,
              ))),
      Container(
          margin: EdgeInsets.only(left: 30, top: 30),
          child: Text('Developer Contacts',style: TextStyle(fontSize: 20),)),
      Container(
        margin: EdgeInsets.only(top: 30),
        child: Container(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      child: Image.asset('assets/myprofilepic.png'),
                      borderRadius: BorderRadius.circular(30),
                      
                    ),
                  ),
                  title: Text('Ashutosh S Kumbhar'),
                  subtitle: Text('github/2727-ask'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      child: Image.asset('assets/sudhanshdp.png'),
                      borderRadius: BorderRadius.circular(30),
                      
                    ),
                  ),
                  title: Text('Sudhansh Jawale'),
                  subtitle: Text('sudhanshjawale@gmail.com'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      child: Image.asset('assets/suyashdp.png'),
                      borderRadius: BorderRadius.circular(30),
                      
                    ),
                  ),
                  title: Text('Suyash M Mate'),
                  subtitle: Text('suyashmate5050@gmail.com'),
                ),
              ),
              
            ],
          ),
        ),
      )
    ]));
  }
}

class ShimmerText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color baseColor;
  final Color highlightedColor;

  const ShimmerText(
      {Key key,
      this.text,
      this.fontsize,
      this.baseColor,
      this.highlightedColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
      child: Shimmer.fromColors(
        baseColor: this.baseColor,
        highlightColor: this.highlightedColor,
        child: Text(
          this.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: this.fontsize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
