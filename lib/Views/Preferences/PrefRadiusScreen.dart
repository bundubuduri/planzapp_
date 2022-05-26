import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:easy_contact_picker/easy_contact_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
//import 'package:search_map_place/search_map_place.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:planzapp/Models/Preferences/PrefModel.dart';
import 'package:planzapp/Views/Home/MainScreen.dart';
import 'package:planzapp/Views/Preferences/PreferencesScreen.dart';
import 'package:planzapp/Views/Preferences/PrefCommuteScreen.dart';
import 'package:planzapp/Views/Preferences/PrefBudgetScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart' as Controllers;
import 'package:planzapp/Controllers/Preferences/RadiusDistanceController.dart';
import 'package:planzapp/Controllers/Preferences/RadiusLocationController.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:planzapp/Services/Preferences/PrefUpdateService.dart';

class PrefRadiusScreen extends StatefulWidget {
  @override
  _PrefRadiusScreen createState() => _PrefRadiusScreen();
}

var launch = true;
final _auth = FirebaseAuth.instance;

class _PrefRadiusScreen extends State<PrefRadiusScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User loggedInUser;

  @override
  void initState() {
    super.initState();
    print("Radius Preference Page Opened");
    getCurrentUser();
  }

  void getCurrentUser() async {
    loggedInUser = await GetUserController().run();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var PrefModel =  Provider.of<PreferencesModel>(context);
    int sliderRadiusDistance = PrefModel.dbRadiusDistance.toInt();
    return Scaffold(
      appBar: AppBar(
        // Back button
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            iconSize: 30.0,
            //color: Colors.blue,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => PreferencesScreen(),
                ),
                (Route route) => false,
              );
            }),
        // Navigate to settings page
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              color: Colors.grey,
              iconSize: 30.0,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MainScreen(),
                  ),
                  (Route route) => false,
                );
              }),
        ],
        title: Text('Radius Preferences'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: ListView(
            children: <Widget>[

              Text(
                  'planzApp requires this information so we can better match you to experience within your selected Radius'),
              Container(
                height: 83,
                  child: SearchMapPlaceWidget(
                apiKey:
                    "AIzaSyA1raSrtTQbDS_URBmS9d2uRVIHweC7qic", // YOUR GOOGLE MAPS API KEY
                // The language of the autocompletion
                language: 'en',
                onSelected: (Place place) async {
                  // save user radius location preferences 
                  RadiusLocationController().run(place);
                  // Notify user preference saved
                  UpdatingSnackbar.showMessage(context);

                },
              )),
              Row(children: <Widget>[
                Expanded(
                  child: Text('Proximity', textAlign: TextAlign.left),
                ),
                IconButton(
                  icon: Icon(Icons.info_rounded),
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                  child: Text('$sliderRadiusDistance Miles',
                      textAlign: TextAlign.center),
                )
              ]),
              // Radius Preference Slider
              Row(children: <Widget>[
                Expanded(
                  child: Slider(
                    value: PrefModel.dbRadiusDistance,
                    min: 0,
                    max: 100,
                    divisions: 20,
                    label: PrefModel.dbRadiusDistance.round().toString(),
                    onChanged: (double value) {
                      context.read<PreferencesModel>().changeRadiusDistance(value);
                      setState(() {
                        PrefModel.dbRadiusDistance = value;
                      });
                      // save user radius preferences
                      RadiusDistanceController().run(PrefModel.dbRadiusDistance);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                    onChangeEnd: (double value) {
                     // FirebaseAnalytics().logEvent(name: 'RadiusDistance',parameters:{'Value':value});
                    },
                  ),
                ),
              ]),

              // Next Button
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PrefBudgetScreen(),
                    ),
                    (Route route) => false,
                  );
                },
                child:
                    const Text('NEXT (Budget)', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
