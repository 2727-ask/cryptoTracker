import 'package:cryptofy/templates/chart/displayChart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDropDownMenu extends StatefulWidget {
  MyDropDownMenu({Key key,this.day,this.month,this.coin}) : super(key: key);

  final day;
  final month;
  final coin;

  

  @override
  _MyDropDownMenuState createState() => _MyDropDownMenuState();
}

class _MyDropDownMenuState extends State<MyDropDownMenu> {


  



  @override
  Widget build(BuildContext context) {

    int today = DateTime.now().day;
    int thisMonth = DateTime.now().month;
    int yesterday = today-1;
    int dayBeforeYesterday = today -2;
    int year = DateTime.now().year;
    
    

    return  SafeArea(
          child: CupertinoPageScaffold(
            child: CupertinoContextMenu(
          
          child:Container(
            child: Icon(Icons.calendar_today),
            
          ),
          actions: [
            CupertinoContextMenuAction(
              child: Text('Today'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayChart(date:'$today',month: '$thisMonth',year: '$year',param: widget.coin ,)));
              },
            ),
            if(today!=1)
            CupertinoContextMenuAction(
              child: Text('Yesterday'),
              onPressed: (){
                print(thisMonth);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayChart(date:'$yesterday',month: '$thisMonth',year: '$year',param: widget.coin ,)));

              },
            ),
            if(today!=1)
            CupertinoContextMenuAction(
              child: Text('Day Before Yesterday'),
              onPressed: (){
                Navigator.of(context).pop();
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayChart(date:'$dayBeforeYesterday',month: '$thisMonth',year: '$year',param: widget.coin ,)));
              },
            ),
            

          ],
        ),
      ),
    );
  }
}