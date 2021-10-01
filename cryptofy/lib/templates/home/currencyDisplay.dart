import 'package:cryptofy/services/checkInternetConnection.dart';
import 'package:cryptofy/services/dataFetched.dart';
import 'package:cryptofy/widgets/noInternet.dart';
import 'package:flutter/material.dart';

class CurrencyDisplay extends StatefulWidget {
  CurrencyDisplay({Key key}) : super(key: key);

  @override
  _CurrencyDisplayState createState() => _CurrencyDisplayState();
}

class _CurrencyDisplayState extends State<CurrencyDisplay> {
  var dataToBeDisplayed = [];
  var connectivityStatus = 1;

  checkNetworkAgain() {
    CheckAppConnection().checkNetworkType().then((myresult) {
      setState(() {
        connectivityStatus = myresult;
      });
    });
  }

  void initState() {
    CheckAppConnection().checkNetworkType().then((myresult) {
      setState(() {
        connectivityStatus = myresult;
      });
    });

    GetData().myFetchedData().then((value) {
      setState(() {
        print(connectivityStatus);
        dataToBeDisplayed = value;
      });
    });
    super.initState();
  }

  Future<Null> refresh() async {
    GetData().myFetchedData().then((value) {
      setState(() {
        print('Hello');
        dataToBeDisplayed = value;

        //print(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (connectivityStatus == 1) {
      return RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
          itemBuilder: (_, index) {
            //print(dataToBeDisplayed);
            //print(index);

            return Container(
              margin: EdgeInsets.only(top: 0),
              child: Card(
                  color: Colors.black,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Container(
                            child: Text(
                              (dataToBeDisplayed[index].name),
                              style: TextStyle(fontSize: 20),
                            ),
                            padding: EdgeInsets.all(2),
                          ),
                        ),
                        Container(
                            child: Row(
                          children: [
                            //Text('Price in USD',style: TextStyle(fontSize: 20),),
                            Text(
                              (double.parse(dataToBeDisplayed[index].usd))
                                  .toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        )),
                      ],
                    ),
                    padding: EdgeInsets.all(30),
                  )),
            );
          },
          itemCount: this.dataToBeDisplayed.length,
        ),
      );
    } else {
      return NoInternet(fx: checkNetworkAgain);
    }
  }
}
