class Model{
  int longitude;
  int latitude;
  Model({this.longitude,this.latitude});
  Model.fromJson(Map<String,dynamic> jsonData){
    this.latitude = jsonData['latitude'];
    this.longitude = jsonData['longitude'];
  }
}