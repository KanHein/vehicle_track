import 'package:http/http.dart' as http;
import 'package:vehicle_track/model/model.dart';
import 'dart:io';
import 'dart:convert';
class Service{
  Future<List> getJsonData() async{
        http.Response response = await http.get('https://vehicletrack-6d337.firebaseio.com/Test.json');
        if(response.statusCode == HttpStatus.ok){
          final jsonResponse = json.decode(response.body);
          final addressJson = jsonResponse['double'];
          var addressData = List(1);
          addressData[0] = addressJson;
          List result = addressData.map((i) => Model.fromJson(i)).toList();
          return result;
        }
  }
}