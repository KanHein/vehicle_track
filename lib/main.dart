import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vehicle_track/service/service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vehicle Tracking'),
        ),
        body: SafeArea(
          child: MapPage(),
        ),
      ),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List address;
  Service service;

  Future initialize() async{
    address = await service.getJsonData();
    setState((){
      address = address;
    });
  }

  @override
  void initState(){
      service = Service();
      Timer.periodic(Duration(seconds: 15), (timer) {
        initialize();
      });
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //API_key => AIzaSyBgb5rQ7UTM3hmYG-PomRhGDAaVCzqDRm8
    //To get latitude => address[0].latitude;
    //To get longitude => address[0].longitude;
    final CameraPosition position = CameraPosition(
      target: LatLng(22.701688, -95.635042),
      zoom: 12,
    );
    return Container(
      child: GoogleMap(
        initialCameraPosition: position,
      ),
    );
  }
}