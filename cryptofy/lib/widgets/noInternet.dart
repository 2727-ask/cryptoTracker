
import 'package:flutter/material.dart';
class NoInternet extends StatelessWidget {
  const NoInternet({Key key,this.fx}) : super(key: key);
  final Function fx;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
        children: [
          Container(
            child: Image(image:AssetImage('assets/no_internet_2.gif')),
          ),
          Container(child:Text('No Internet',style: TextStyle(fontSize: 30),),margin:EdgeInsets.all(30)),
          Container(child: Text('Please Check Your Network Connection or try refreshing the app'),margin:EdgeInsets.fromLTRB(30,0,20,20)),
          Container(child: ElevatedButton(child: Text('Refresh'),onPressed:()=>fx()),)
        ],
      ));
  }
}