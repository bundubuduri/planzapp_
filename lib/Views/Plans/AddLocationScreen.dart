import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:planzapp/Views/Plans/AddDateAndTimeScreen.dart';
import 'package:planzapp/Views/Plans/AddPeopleScreen.dart';
import 'package:planzapp/util/Plan.dart';
import 'package:planzapp/util/universalVariables.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:planzapp/Views/Plans/CreatePlan.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planzapp/Views/Plans/MapSuggestionsScreen.dart';
import 'package:planzapp/util/API Client/Client.dart';

class AddLocationScreen extends StatefulWidget {
  Plan plan;
  AddLocationScreen({@required this.plan});

  @override
  _AddLocationScreenState createState() => _AddLocationScreenState();
}

var launch = true;
var showPlaceDetails = false;

class _AddLocationScreenState extends State<AddLocationScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User loggedInUser;
  String _dbPreferences = "";
  TextEditingController textEditingControllerPrice =
      new TextEditingController();

  // initialize a spot object
  Spot spot = new Spot.noLocation();

  var minRadius = 100.0;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    setCustomMapPin();
    getPreferences();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getPreferences() async {
    var dbPreferences = await fetchPreferences();
    _dbPreferences = dbPreferences.body.toString();
    _dbPreferences = _dbPreferences.replaceAll('"', '');
    _dbPreferences = _dbPreferences.replaceAll(',', ', ');
    _dbPreferences = _dbPreferences.replaceAll('[', '');
    _dbPreferences = _dbPreferences.replaceAll(']', '');
    setState(() {});
  }

  Future<Map> getPlaceDetails(Place location) async {
    // this function will take in the location that the user selected and get the details of the location
    var results;
    // get the coordinates
    var c = await location.geolocation;
    // create coordinate map
    var coordinates = {
      'lat': c.coordinates.latitude,
      'lng': c.coordinates.longitude
    };
    // get the details of the coordinates
    try {
      results = await spot.details(coordinates: coordinates, filter: true);
    } catch (e) {
      print("There was an error $e");
      results = null;
    }

    // return the details Map
    return results;
  }

  // This function calls the firebase function that gets the plan's internal users' preferences
  Future fetchPreferences() async {
    Uri url = Uri.parse(
        'https://us-central1-planzapp-2c02d.cloudfunctions.net/groupPreferences?text=' +
            FirebaseAuth.instance.currentUser.email.toString() +
            " " +
            widget.plan.planInternalUsers.toString());
    final response = await http.get(url);
    print(FirebaseAuth.instance.currentUser.email.toString() +
        " " +
        widget.plan.planInternalUsers.toString());
    if (response.statusCode == 200) {
      return response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load group preferences');
    }
  }

  GoogleMapController mapController;

  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(21.648611, -157.925556),
    zoom: 14,
  );

  Place selectedPlace;
  var userLocationPrefString;
  var userLocationPref;
  var initialPosition = LatLng(21.648611, -157.925556);

  // will hold the results from a foursquare API Call
  var results;

  double _sliderValue = 20.0;
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  LatLng pinPosition = LatLng(21.648611, -157.925556);

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/map_pin.png');
  }

  Widget listLocations(List<dynamic> places) {
    List<Widget> list = new List<Widget>();

    if (places != null) {
      for (var i = places.length - 1; i > -1; i--) {
        var place = places[i];
        // format place name
        String placeName = place.split(" | ")[0].split(",")[0].split("&")[2];
        list.add(
          Padding(
            padding:
                const EdgeInsets.only(top: 5.0, bottom: 5, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  placeName,
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                // button to delete an added place
                FlatButton(
                  color: Colors.grey[300],
                  textColor: Colors.black,
                  onPressed: () {
                    setState(() {
                      widget.plan.planPlacesWithTime.remove(place);
                    });
                    Fluttertoast.showToast(
                      msg: placeName + " Deleted",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                    );
                  },
                  child: Text(
                    "Remove",
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }

    return new Column(children: list);
  }

  void getUserLocationPref() async {
    DocumentSnapshot<Map<String, dynamic>> variable = await FirebaseFirestore
        .instance
        .collection('User')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('Preferences')
        .doc('Preferences')
        .get();
    userLocationPrefString = variable.data()["RadiusLocationLatLong"];
    //initialPosition = userLocationPref;
    var userLocationPrefDescriptionString =
        variable.data()['RadiusLocationDescription'];

    print("hi");
    // if we user location pref is not set
    if (userLocationPrefString == null) {
      userLocationPrefString = "";
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
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
        msg: "Your Location Preference is Set to " +
            userLocationPrefDescriptionString,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
      );
      print(userLocationPrefString);
      print(userLocationPrefString.substring(
          7, userLocationPrefString.length - 1));
      var latitude = double.parse(userLocationPrefString
          .substring(7, userLocationPrefString.length - 1)
          .split(",")[0]);
      var longitude = double.parse(userLocationPrefString
          .substring(7, userLocationPrefString.length - 1)
          .split(",")[1]);
      print(latitude);
      print(longitude);
      //initialPosition =  LatLng(latitude, longitude);
      userLocationPref = LatLng(latitude, longitude);
    }
  }

  void getMinRadiusPreferences(List<dynamic> strings) async {
    for (var i = strings.length - 1; i > -1; i--) {
      var radius;
      String temp = strings[i];
      //var userName = temp.split(" : ")[0];
      var userEmail = temp.split(" : ")[1];
      DocumentSnapshot<Map<String, dynamic>> variable = await FirebaseFirestore
          .instance
          .collection('User')
          .doc(userEmail)
          .collection('Preferences')
          .doc('Preferences')
          .get();
      radius = variable.data()['RadiusDistance'];
      print("got radius");
      print(radius);
      if (radius < minRadius) {
        minRadius = radius;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getMinRadiusPreferences(widget.plan.planInternalUsers);

    textEditingControllerPrice.text = widget.plan.planPrice;

    if (userLocationPrefString == null) {
      Future.delayed(
        const Duration(seconds: 0),
        () => getUserLocationPref(),
      ).then((value) {
        print('success');
        setState(() {
          if (mapController != null) {
            mapController
                .animateCamera(CameraUpdate.newLatLng(userLocationPref));
          }
        });
      });
      print('Waiting.'); // Prints first.

    }
    // print(userLocationPref);
    if (launch) {
      launch = false;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          MyAppBar(
            title: Center(
              child: Text(
                'Where would you like to go?',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 5, left: 20, right: 20),
              child: Text(
                "Add Location",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  foreground: Paint()..color = Colors.black54,
                ),
              )),

          // Display group's preferences in common and button to view suggested locations on map
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 10, bottom: 5),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Text(
                  "People on this plan have these preferences in common: " +
                      _dbPreferences,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    foreground: Paint()..color = Colors.black, //[700],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                // button to delete an added place
                FlatButton(
                  color: Color(0xFF00a79B),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            MapSuggestionsScreen(plan: widget.plan),
                      ),
                      (Route route) => false,
                    );
                  },
                  child: Text(
                    "View Suggested Locations",
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 20, left: 10),
            child: TextField(
              controller: textEditingControllerPrice,
              textAlign: TextAlign.center,
              onChanged: (value) {
                widget.plan.planPrice = value;
              },
              decoration:
                  InputDecoration(hintText: 'Estimated Price for this Plan'),
            ),
          ),
          SizedBox(
            height: 10,
            width: 20,
          ),

          Container(
              height: 83,

                child: SearchMapPlaceWidget(

            apiKey:
                "AIzaSyA1raSrtTQbDS_URBmS9d2uRVIHweC7qic", // GOOGLE MAPS API KEY
            // The language of the autocompletion
            language: 'en',
            // The position used to give better recommendations. In this case we are using the user position
            location: userLocationPref == null
                ? initialPosition
                : userLocationPref, //initialPosition,
            radius: (_sliderValue * 1609.34).toInt(),
            strictBounds: true,

            // empty
            onSelected: (Place place) async {
              final geolocation = await place.geolocation;

              // get the details for the current place
              results = await getPlaceDetails(place);
              print('Results: $results');

              setState(() {
                selectedPlace = place;
                showPlaceDetails = true;
                pinPosition = geolocation.coordinates;
                _markers.add(Marker(
                    markerId: MarkerId("aloha"),
                    position: pinPosition,
                    icon: pinLocationIcon));
              });

              // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
              //final GoogleMapController controller = await _mapController.future;
              mapController.animateCamera(
                  CameraUpdate.newLatLng(geolocation.coordinates));
              mapController.animateCamera(
                  CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
            },
                )

          ),

          // once a place selected, we will show the detail and hide slider, for user to make decision to add this place or not
          (showPlaceDetails && selectedPlace != null
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        selectedPlace.description.split(",")[0],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "\nAddress: " +
                            "${results == null ? 'Address not available.' : results['address']}" +
                            "\nAbout: " +
                            '${results == null ? 'Description not available' : results['description']} \nStatus: ${results == null ? 'Status not available' : results['closes']}\n',
                        style: TextStyle(height: 1.5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Colors.blueAccent,
                            child: Text("Add"),
                            onPressed: () {
                              setState(() {
                                var typesString =
                                    selectedPlace.types.join(", ");
                                widget.plan.planPlacesWithTime.add(
                                    "Date & Time & " +
                                        selectedPlace.description +
                                        " | " +
                                        typesString);
                                showPlaceDetails = false;
                              });
                            },
                          ),
                          SizedBox(
                            height: 10,
                            width: 20,
                          ),
                          FlatButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Colors.blueAccent,
                            child: Text("No"),
                            onPressed: () {
                              setState(() {
                                showPlaceDetails = false;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ))
              : Slider(
                  min: 1,
                  max: 100,
                  value: _sliderValue,
                  divisions: 100,
                  label: _sliderValue.round().toString() + " miles",
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                    // print(value);
                    // print("minRadius");
                    // print(minRadius);

                    if (value > minRadius) {
                      print("radius too large");
                      Fluttertoast.showToast(
                        msg: "Radius exceed people preference",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                      );
                    }
                  },
                )),

          Column(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.9, // or use fixed size like 200
              height: MediaQuery.of(context).size.height * 0.3,
              child: GoogleMap(
                //myLocationEnabled: true,
                mapType: MapType.hybrid,
                initialCameraPosition: cameraPosition,
                markers: _markers,

                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
              ),
            )
          ]),

          SizedBox(
            height: 10,
          ),

          Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 5, left: 20, right: 20),
              child: Text(
                "Places for this plan:",
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  foreground: Paint()..color = Color(0xFF00a79B),
                ),
              )),

          (widget.plan.planPlacesWithTime.length != 0
              ? listLocations(widget.plan.planPlacesWithTime)
              : SizedBox(
                  height: 10,
                )),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () async {
                    print(widget.plan.show());

                    if (widget.plan.planPrice == null ||
                        widget.plan.planPrice == "") {
                      Fluttertoast.showToast(
                        msg: "Please add price for this plan",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                      );
                    } else if (widget.plan.planPlacesWithTime.length == 0) {
                      Fluttertoast.showToast(
                        msg: "Please add location(s) for this plan",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                      );
                    } else {
                      if (widget.plan.cameFromViewItineraryPage) {
                        Fluttertoast.showToast(
                          msg: "Location Updated",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                        );
                      }
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddDateAndTimeScreen(plan: widget.plan),
                          ));
                    }
                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    widget.plan.cameFromViewItineraryPage ? 'Update' : 'NEXT',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 100.0,
                    height: 50.0,
                    child: new RaisedButton(
                      child: new Text('Cancel'),
                      onPressed: () async {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, 'Main');

                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Save Progress?",
                                  style: TextStyle(fontStyle: FontStyle.normal),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Yes"),
                                    onPressed: () {
                                      UniversalMethods.savePlanDataToDatabase(
                                          widget.plan);
                                      Navigator.pop(context, true);
                                    },
                                  ),
                                  FlatButton(
                                    child: Text("No"),
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                  )
                                ],
                              );
                            });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
