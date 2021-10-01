import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/centers.dart';


class PinData{
Future<Centers> getData() async{
  var url = Uri.parse('https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=411046&date=05-06-2021');
  http.Response response = await http.get(url);
  print(url);
  print(response.body);
  var values = json.decode(response.body);
  print(values['sessions']);
  for (var item in values['sessions']) {
    
  }
}}

