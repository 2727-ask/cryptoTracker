
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/bottomNavigationBar.dart';
import './widgets/myDrawer.dart';



void main() {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new MyApp());
    });
}





class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoTrack',
      initialRoute: '/',
      routes: {},
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.black87,
        backgroundColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CryptoTrack'),
        ),
        drawer: MyAppDrawer(),
        body: MyBottomNavBar(),
      ),
    );
  }
}
