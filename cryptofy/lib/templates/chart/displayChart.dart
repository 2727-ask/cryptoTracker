import 'package:cryptofy/models/plotter.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class DisplayChart extends StatefulWidget {
  final String param;
  final String year;
  final String month;
  final String date;

  const DisplayChart({Key key, this.param, this.year, this.month, this.date})
      : super(key: key);

  @override
  _DisplayChartState createState() => _DisplayChartState();
}

CrosshairBehavior _crosshairBehavior;
ZoomPanBehavior _zoomPanBehavior;

class _DisplayChartState extends State<DisplayChart> {
  List cryptoDataList;

  Color high = Colors.green;
  Color low = Colors.green;

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
        enablePanning: true,

        // Enables pinch zooming
        enablePinching: true);
    _crosshairBehavior = CrosshairBehavior(
        enable: true,
        lineColor: Colors.red,
        lineDashArray: <double>[5, 5],
        lineWidth: 2,
        lineType: CrosshairLineType.vertical);

    fetchData(widget.param, widget.year, widget.month, widget.date);
    super.initState();
  }

  void fetchData(var coinName, var year, var month, var date) async {
    await Firebase.initializeApp();

    FirebaseFirestore.instance
        .collection('$coinName/$year/$month/$date/Data')
        .orderBy('time')
        .snapshots()
        .listen((event) {
      setState(() {
        cryptoDataList = event.docs;

        if (cryptoDataList.length >= 2 && cryptoDataList != null) {
          if (cryptoDataList[cryptoDataList.length - 1]['price'] <
              cryptoDataList[cryptoDataList.length - 2]['price']) {
            high = Colors.red;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    var dateData = DateTime.now();
    var today = dateData.day;
    var yesterday = dateData.subtract(Duration(days:1)).day;
    var thisYear = dateData.year;
    var thisMonth = dateData.month;
    
    if (cryptoDataList != null && cryptoDataList.length >= 2) {
      return Scaffold(
          appBar: AppBar(title: Text(widget.param)),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: Chip(
                        label: Text(widget.param),
                        backgroundColor: Colors.purpleAccent[100],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: Chip(
                        backgroundColor: low,
                        label: Text((cryptoDataList[cryptoDataList.length - 2]
                                ['price'])
                            .toString()),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: Chip(
                        backgroundColor: high,
                        label: Text((cryptoDataList[cryptoDataList.length - 1]
                                ['price'])
                            .toString()),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: ActionChip(
                        backgroundColor: Colors.pinkAccent,
                        label: Text(widget.date + '/' + widget.month), onPressed: () { print('pressed'); },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      //  child: MyDropDownMenu(
                      // //   coin: widget.param,
                      //  ),
                      child: new DropdownButton<String>(
                        items: <String>[today.toString(),yesterday.toString()].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {
                          print(widget.param);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayChart(date:_.toString(),month:thisMonth.toString(),year:thisYear.toString(),param: widget.param,)));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: deviceHeight - (18 * deviceHeight / 60),
                      child: SfCartesianChart(
                          crosshairBehavior: _crosshairBehavior,
                          primaryXAxis: CategoryAxis(),
                          series: <ChartSeries>[
                            // Initialize line series
                            LineSeries<CryptoData, double>(
                              enableTooltip: true,
                              dataSource:
                                  List.generate(cryptoDataList.length, (index) {
                                return CryptoData(
                                    price: double.parse(cryptoDataList[index]
                                            ['price']
                                        .toString()),
                                    time: double.parse(cryptoDataList[index]
                                            ['time']
                                        .toString()));
                              }),

                              /*

                               trendlines:<Trendline>[
                                 Trendline(
                                type: TrendlineType.linear, 
                                color: Colors.blue)
                             ],
                             */
                              xValueMapper: (CryptoData coin, _) => (coin.time),
                              yValueMapper: (CryptoData coin, _) =>
                                  (coin.price).toDouble(),
                            )
                          ],
                          zoomPanBehavior: _zoomPanBehavior))),
            ],
          ));
    } else {
      return Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              children: [
                Center(child: CircularProgressIndicator()),
                Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Center(
                        child: Text('Fetching Data,Connecting to server')))
              ],
            ),
          ),
        ),
      );
    }
  }
}
