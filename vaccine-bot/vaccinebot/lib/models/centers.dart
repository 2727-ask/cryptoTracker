import 'package:http/http.dart' as http;


Object getData() async{
  var url = Uri.parse('https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=411046&date=05-06-2021');
  http.Response response = await http.get(url);
  print(url);
  print(response.body);
  return response.body;
}

class Centers{
  var session;
  var centerId;
  var name;
  var address;
  var state;
  var district;
  var blockName;
  var pincode;

  Centers({
    this.session,
    this.centerId,
    this.name,
    this.address,
    this.state,
    this.district,
    this.blockName,
    this.pincode
  });

  fetchedData(var data){
    this.centerId = data['centerId'];
    this.name = data['name'];
    this.address = data['address'];
    this.state = data['state_name'];
    this.district = data['district_name'];
    this.blockName = data['block_name'];
    this.pincode = data['pincode'];
    return this;
  }


}

var a = getData();

