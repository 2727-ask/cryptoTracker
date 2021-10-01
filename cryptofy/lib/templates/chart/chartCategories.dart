
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'displayChart.dart';
var today = DateTime.now();

class ChartCategories extends StatelessWidget {
  
  const ChartCategories({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[

              

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayChart(
                              param: 'BTC',
                              year: '2021',
                              month: (today.month).toString(),
                              date: (today.day).toString())));
                },
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: Image(image: AssetImage('assets/bitcoin2.png')),
                    decoration: BoxDecoration(
                      color: Colors.teal[400],
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayChart(
                              param: 'ETH',
                              year: '2021',
                              month: (today.month).toString(),
                              date: (today.day).toString())));
                },
                child: Container(
                    child: Container(
                      child:
                          Image(image: AssetImage('assets/etherium_img.png')),
                      padding: EdgeInsets.all(20),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[400],
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayChart(
                              param: 'DOGE',
                              year: '2021',
                              month: (today.month).toString(),
                              date: (today.day).toString())));
                },
                child: Container(
                    child: Container(
                      child: Image(image: AssetImage('assets/dogecoin.png')),
                      padding: EdgeInsets.all(20),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.brown[400],
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
