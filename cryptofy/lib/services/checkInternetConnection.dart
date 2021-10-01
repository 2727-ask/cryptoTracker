

import 'package:connectivity/connectivity.dart';

class CheckAppConnection{
  int result = 0;

  

  Future checkNetworkType() async {
 
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print(connectivityResult);
      result = 1;
      
      
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print(connectivityResult.index);
      result = 1;
    }
    else if(connectivityResult == ConnectivityResult.none){
      print('No Internet');
      result = 0;
      
    }
    return result;
    
  }


  

}