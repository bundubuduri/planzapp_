
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:search_map_place/search_map_place.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planzapp/util/Plan.dart';
import 'package:planzapp/util/universalVariables.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:planzapp/Views/Plans/AddPeopleScreen.dart';
import 'package:planzapp/Views/Plans/AddLocationScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Shows places to eat nearby
class MapSuggestionsScreen extends StatefulWidget {
  //final String keyword;
  Plan plan;
  MapSuggestionsScreen({@required this.plan});

  @override
  State<StatefulWidget> createState() {
    return _MapSuggestionsScreen();
  }
}

class _MapSuggestionsScreen extends State<MapSuggestionsScreen>{

  static const String _API_KEY = '{{AIzaSyA1raSrtTQbDS_URBmS9d2uRVIHweC7qic}}';

  static double latitude = 21.648611;
  static double longitude = -157.925556;
  static const String baseUrl =
  "https://maps.googleapis.com/maps/api/place/nearbysearch/json";

  List<Marker> markers = <Marker>[];
  Error error;
  bool isSearching = true;
  String keyword;

  GoogleMapController mapController;
  

  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(21.648611, -157.925556),
    zoom: 16,);

  var userLocationPrefString;
  var userLocationPref;
  var initialPosition = LatLng(21.648611, -157.925556);

  void getUserLocationPref() async {
    DocumentSnapshot<Map<String, dynamic>> variable = await FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser.email).collection('Preferences').doc('Preferences').get();
    userLocationPrefString = variable.data()['RadiusLocationLatLong'];
    //initialPosition = userLocationPref;
    var userLocationPrefDescriptionString = variable.data()['RadiusLocationDescription'];

    print("hi");
    // if we user location pref is not set
    if(userLocationPrefString == null) {
      userLocationPrefString = "";
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print("my location is");
      print(position);
      userLocationPref = LatLng(position.latitude, position.longitude);
      Fluttertoast.showToast(
        msg: "Location Preference not Set, Using Your Current Location...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
      );

    } else {
      Fluttertoast.showToast(
        msg: "Your Location Preference is Set to " + userLocationPrefDescriptionString,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
      );
      print(userLocationPrefString);
      print(userLocationPrefString.substring(7,userLocationPrefString.length-1));
      latitude = double.parse(userLocationPrefString.substring(7,userLocationPrefString.length-1).split(",")[0]);
      longitude = double.parse(userLocationPrefString.substring(7,userLocationPrefString.length-1).split(",")[1]);
      print(latitude);
      print(longitude);
      //initialPosition =  LatLng(latitude, longitude);
      userLocationPref = LatLng(latitude, longitude);
    }



  }

  // void getMinRadiusPreferences(List<dynamic> strings) async {
  //   for(var i = strings.length - 1; i > -1; i--) {
  //     var radius;
  //     String temp = strings[i];
  //     //var userName = temp.split(" : ")[0];
  //     var userEmail = temp.split(" : ")[1];
  //     DocumentSnapshot variable = await Firestore.instance.collection('User').document(userEmail).collection('Preferences').document('Preferences').get();
  //     radius = variable.data()['RadiusDistance'];
  //     print("got radius");
  //     print(radius);
  //     if (radius < UniversalVariables.minRadius) {
  //       UniversalVariables.minRadius = radius;
  //     }
  //   }
  // }

  // This function calls the firebase function that gets the plan's internal users' preferences
  Future fetchPreferences() async{
    Uri url = Uri.parse('https://us-central1-planzapp-2c02d.cloudfunctions.net/groupPreferences?text=' + widget.plan.planInternalUsers.toString());
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load group preferences');
    }
  }

  String _dbPreferences = "";
  void getPreferences() async {
    var dbPreferences = await fetchPreferences();
    _dbPreferences = dbPreferences.body.toString();
    _dbPreferences = _dbPreferences.replaceAll(",",' OR ');
    _dbPreferences = _dbPreferences.replaceAll('\[','');
    _dbPreferences = _dbPreferences.replaceAll('\]','');
    //for (var i in _dbPreferences){
      //newString += _dbPreferences[i];
    //}
    //_dbPreferences.forEach((n) => print('Hello'));
    //print(_dbPreferences);
    setState(() {});
  }

  void updateKeyWord(String newKeyword) {
    print(newKeyword);
    setState(() {
      keyword = newKeyword;  
    });
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    if(userLocationPrefString == null) {
      // getUserLocationPref();
      // Future.delayed(Duration(seconds: 2), () => getUserLocationPref());

      Future.delayed(
        const Duration(seconds: 0),
        () => getUserLocationPref(),
      ).then((value) {
          print('success');
          setState(() {
              if(mapController != null) {
                mapController.animateCamera(CameraUpdate.newLatLng(userLocationPref));
              }
          });
      });
      print('Waiting.'); // Prints first.

    }
    if (launch) {

      launch = false;
    }

    return MaterialApp(
      home: Scaffold(
         appBar: AppBar(
           // Back button 
           leading:
           IconButton(
             icon: Icon(Icons.chevron_left),
             iconSize: 30.0,
             //color: Colors.blue,
             onPressed: () {
               Navigator.of(context).pushAndRemoveUntil(
                 MaterialPageRoute(
                   builder: (BuildContext context) => AddLocationScreen(plan: widget.plan),
                 ),
                 (Route route) => false,
               );
           }),
          title: Text('Suggested Locations'),
        ), 
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: cameraPosition,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            getPreferences();
            searchArea(latitude, longitude);
          },
          markers: Set<Marker>.of(markers),
        ),

      ),
    );
  }


  void searchArea(double latitude, double longitude) async {
    setState(() {
      markers.clear();
    });
    Uri url =
    Uri.parse('$baseUrl?key=$_API_KEY&location=$latitude,$longitude&radius=10000&keyword=$_dbPreferences');
    print(url);
    final response = await http.get(url);

    // make sure to hide searching
    setState(() {
      isSearching = false;
    });
  }

}

