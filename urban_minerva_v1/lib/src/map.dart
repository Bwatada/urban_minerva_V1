import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

var apiKey = "AIzaSyDRMLQyg-dYGOSuvTCckuQ14qQnc9MAGOc";
class Map extends StatefulWidget {
  @override
  State createState() => MapState();
}

class MapState extends State<Map> {

  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
              ),
            ),
          ),
          RaisedButton(
            child: const Text('Go to London'),
            onPressed: mapController == null ? null : () {
              mapController.animateCamera(CameraUpdate.newCameraPosition(
                const CameraPosition(
                  bearing: 270.0,
                  target: Location.getLocation,
                  tilt: 30.0,
                  zoom: 17.0,
                ),
              ));
            },
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() { mapController = controller; });
  }
}