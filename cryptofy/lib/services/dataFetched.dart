//import 'dart:html';

import 'package:bitpanda_price_ticker/bitpanda_price_ticker.dart' as mydata;
import 'package:cryptofy/models/currency_model.dart';
import 'package:http/http.dart';

class GetData {
  List<CryptoCurrency> myData = [];
  Future<List<CryptoCurrency>> myFetchedData() async {
    final Map<String, Map> mymap = await mydata.fetch(client: Client());
    mymap.forEach((key, value) {
      CryptoCurrency ptc =
          CryptoCurrency().fetchedValue(cryptoName: key, cryptoPrices: value);
      myData.add(ptc);
    });
    return myData;
  }
}
