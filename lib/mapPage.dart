import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location2/location2.dart';
import 'package:my_project/model/user_model.dart';

class mapPage extends StatefulWidget {
  const mapPage({Key? key}) : super(key: key);

  @override
  State<mapPage> createState() => mapPageState();
}

class mapPageState extends State<mapPage> {
  late GoogleMapController _mapController;
  Map<String, Marker> _markers = {};
  late BitmapDescriptor femIcon;
  late BitmapDescriptor guyIcon;

  @override
  void initState() {
    super.initState();
  }

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);
  static const LatLng currentLocation = LatLng(37.33470606, -122.04572128);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Maps",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(currentUser.latitude, currentUser.longitude),
          zoom: 13.5,
        ),
        onMapCreated: (controller) {
          _mapController = controller;
          for (int i = 0; i < allUsers.length; i++) {
            if (allUsers[i] != currentUser && allUsers[i].visible == true)
              addMarker(
                  i.toString(),
                  LatLng(allUsers[i].latitude, allUsers[i].longitude),
                  allUsers[i]);
            print(
                '${allUsers[i].visible} + ${allUsers[i].latitude} + ${allUsers[i].longitude}');
          }
          addMarker('test', LatLng(currentUser.latitude, currentUser.longitude),
              currentUser);
        },
        markers: _markers.values.toSet(),
      ),
    );
  }

  String calculateAge(String dateString) {
    DateTime currentDate = DateTime.now();
    DateTime birthDate = DateTime.parse(dateString);

    int age = currentDate.year - birthDate.year;

    // Check if the birthday hasn't occurred yet this year
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return age.toString();
  }

  addMarker(String ID, LatLng location, User u) async {
    var marker = Marker(
      markerId: MarkerId(ID),
      position: location,
      infoWindow: InfoWindow(
        title: u.fullname,
        snippet:
            'Blood Group: ${u.bloodGroup} ${u.rh_factor} Age: ${calculateAge(u.dob)}',
      ),
      icon: (u == currentUser)
          ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet)
          : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    );

    _markers[ID] = marker;
    setState(() {});
  }
}
