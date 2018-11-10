import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
var apiKey = "AIzaSyDRMLQyg-dYGOSuvTCckuQ14qQnc9MAGOc";
class MapApp extends StatefulWidget {
  @override
  State createState() => MapAppState();
}

class MapAppState extends State<MapApp>   
  with AutomaticKeepAliveClientMixin

  {

  @override
  bool get wantKeepAlive => true;

  GoogleMapController mapController;

  Map<String, double> _startLocation;
  Map<String, double> _currentLocation;

  Location _location = new Location();
  bool _permission = false;

  StreamSubscription<Map<String, double>> _locationSubscription;

  String error;

  @override
  void initState() {
    super.initState();

    initPlatformState();

    _locationSubscription =
        _location.onLocationChanged().listen((Map<String,double> result) {
          setState(() {
            _currentLocation = result;
          });
        });
  }

  initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      _permission = await _location.hasPermission();
      location = await _location.getLocation();


      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    setState(() {
        _startLocation = location;
    });

  }
  
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets;

    if (_currentLocation == null) {
      widgets = new List();
    } else {
      widgets = [];
    }

    widgets.add(new Center(
        child: new Text(_startLocation != null
            ? 'Start location: ' + _startLocation['latitude'].toString() + '\n'
            : 'Error: $error\n',
            textScaleFactor: 0.2,)));

    widgets.add(new Center(
        child: new Text(_currentLocation != null
            ? 'Continuous location: $_currentLocation\n'
            : 'Error: $error\n',
            textScaleFactor: 0.2,)));

    widgets.add(new Center(
      child: new Text(_permission 
            ? 'Has permission : Yes' 
            : "Has permission : No",
            textScaleFactor: 0.2,)));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Available Racks",
      home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Align(
                child:
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                      ),
                    ),
                  ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "The Hoot #5",
                              textScaleFactor: 0.9,
                              style: TextStyle( 
                                color: Color.fromRGBO(89, 89, 89, 1.0),
                                decorationColor: null,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              "2 Racks Open",
                              textScaleFactor: 0.9,
                              style: TextStyle( 
                                color: Color.fromRGBO(89, 89, 89, 1.0),
                                decorationColor: null,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "@222 Spadina Ave",
                              textScaleFactor: 0.9,
                              style: TextStyle( 
                                color: Color.fromRGBO(89, 89, 89, 1.0),
                                decorationColor: null,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              "4km away",
                              textScaleFactor: 0.9,
                              style: TextStyle( 
                                color: Color.fromRGBO(89, 89, 89, 1.0),
                                decorationColor: null,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ],
                        )
                      ],
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      color: Color.fromRGBO(53, 147, 200, 1.0),
                      child: Text('Reserve'),
                      onPressed: mapController == null ? null : () {
                        mapController.animateCamera(CameraUpdate.newCameraPosition(
                          CameraPosition(
                            bearing: 0,
                            target: LatLng(_currentLocation['latitude'],_currentLocation['longitude']),
                            tilt: 30.0,
                            zoom: 17.0,
                          ),
                        ));
                      },
                    ),
                    Text(
                      "This will reserve an open rack for 15 minutes.",
                      textScaleFactor: 0.9,
                      style: TextStyle( 
                        color: Color.fromRGBO(89, 89, 89, 1.0),
                        decorationColor: null,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: mapController == null ? null : () {
              mapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  bearing: 0,
                  target: LatLng(_currentLocation['latitude'],_currentLocation['longitude']),
                  tilt: 30.0,
                  zoom: 17.0,
                ),
              ));
            },
            tooltip: 'Increment',
            child: Icon(Icons.my_location),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        )
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() { mapController = controller; });
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(_currentLocation['latitude'],_currentLocation['longitude']),
          tilt: 30.0,
          zoom: 17.0,
        )
      )
    );
  }
}