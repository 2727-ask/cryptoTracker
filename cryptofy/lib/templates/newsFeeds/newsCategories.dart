import 'package:cryptofy/services/checkInternetConnection.dart';
import 'package:cryptofy/templates/newsFeeds/newsDetails.dart';
import 'package:cryptofy/widgets/noInternet.dart';
import 'package:flutter/material.dart';
import 'package:cryptofy/services/newsApi.dart' as ndata;

void main() {
  runApp(NewsCategories());
}

class NewsCategories extends StatefulWidget {
  @override
  _NewsCategoriesState createState() => _NewsCategoriesState();
}

class _NewsCategoriesState extends State<NewsCategories> {
  var news = [];
  var result = 1;
  int _value = 0;
  List currencyList = [
    'Bitcoin',
    'Etherium',
    'Dogecoin',
    'BitCoin Cash',
    'BlockChain',
    'Cryptocurrency'
  ];

  String newQuery = "BitCoin";

  void recheckAppConnection() {
    CheckAppConnection().checkNetworkType().then((myresult) {
      setState(() {
        result = myresult;
      });
    });
  }

  @override
  void initState() {
    CheckAppConnection().checkNetworkType().then((myresult) {
      setState(() {
        result = myresult;
        print(currencyList.length);
      });
    });

    ndata.getNewsData(newQuery).then((value) {
      setState(() {
        news = value;
        print('result is $result');
      });
    });

    super.initState();
  }

  var mytitle = 'BitCoin';

  void navigateNews(String argument) {
    ndata.getNewsData(argument).then((value) {
      setState(() {
        news = value;
        mytitle = argument;
      });
    });
  }

  Widget build(BuildContext context) {
    if (result == 1) {
      return Container(
        child: new Column(
          children: <Widget>[
            Container(
              height: 30,
              margin: EdgeInsets.only(bottom: 5),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    List<Widget>.generate(currencyList.length, (int index) {
                  return Container(
                    margin: EdgeInsets.only(left:10),
                    child: ChoiceChip(
                      
                      label: Text(currencyList[index]),
                      selected: _value == index,
                      onSelected: (bool selected) {
                        navigateNews(currencyList[index]);
                        setState(() {
                          _value = selected ? index : null;
                        });
                      },
                    ),
                  );
                }),
              ),
            ),

            Expanded(
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: news.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Row(
                        children: <Widget>[
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsDetails(
                                            param: news[index],
                                          )));
                            },
                            child: Card(
                              child: Container(
                                child: Column(
                                  children: [
                                    if (news[index].urlToImage != null)
                                      Image.network(news[index].urlToImage),
                                    Container(
                                      child: Text(news[index].title),
                                      margin: EdgeInsets.all(12),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(7),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Published At : ',
                                            style: TextStyle(
                                                color: Colors.white60),
                                          ),
                                          Text(
                                            (news[index].publishedAt)
                                                .toString()
                                                .substring(0, 10),
                                            style: TextStyle(
                                                color: Colors.greenAccent),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            //Text((news.length).toString())
          ],
        ),
        margin: EdgeInsets.all(10.0),
      );
    } else {
      return NoInternet(
        fx: recheckAppConnection,
      );
    }
  }
}
