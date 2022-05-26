import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:planzapp/util/universalMethods.dart';
import 'package:planzapp/Models/Preferences/PrefModel.dart';
import 'package:planzapp/Views/SettingsUserAccount/Settings_Screen.dart';
import 'package:planzapp/Views/Home/MainScreen.dart';
import 'package:planzapp/Views/Preferences/PrefMultiPlanScreen.dart';
import 'package:planzapp/Views/Preferences/PrefAmbiDensiScreen.dart';
import 'package:planzapp/Views/Preferences/PrefBudgetScreen.dart';
import 'package:planzapp/Views/Preferences/PrefCommuteScreen.dart';
import 'package:planzapp/Views/Preferences/PrefCuisineScreen.dart';
import 'package:planzapp/Views/Preferences/PrefHealthCovidScreen.dart';
import 'package:planzapp/Views/Preferences/PrefLocationFeaturesScreen.dart';
import 'package:planzapp/Views/Preferences/PrefLocalSpotScreen.dart';
import 'package:planzapp/Views/Preferences/PrefDietScreen.dart';
import 'package:planzapp/Views/Preferences/PrefFeaturesScreen.dart';
import 'package:planzapp/Views/Preferences/PrefPaymentsScreen.dart';
import 'package:planzapp/Views/Preferences/PrefRadiusScreen.dart';
import 'package:planzapp/Views/Preferences/PrefRelatScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';

class PreferencesScreen extends StatefulWidget {
  @override
  _PreferencesScreen createState() => _PreferencesScreen();
}

class _PreferencesScreen extends State<PreferencesScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User? loggedInUser;

  @override
  void initState() {
    super.initState();
    print("Preference page opened");
    getCurrentUser();
    PreferencesModel().setup();
  }

  void getCurrentUser() async {
    loggedInUser = await GetUserController().run();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    var PrefModel =  Provider.of<PreferencesModel>(context);
    String? budgetPreferences = PrefModel.budgetPreferences;
    String? multiplePlansPreferences = PrefModel.multiplePlansPreferences;
    String? commutePreferences = PrefModel.commutePreferences;
    String? cuisinePreferences = PrefModel.cuisinePreferences;
    String? healthCovidPreferences = PrefModel.healthCovidPreferences;
    String? dietPreferences = PrefModel.dietPreferences;
    String? generalFeaturesPreferences = PrefModel.generalFeaturesPreferences;
    String? localSpotPreferences = PrefModel.localSpotPreferences;
    String? locationFeaturesPreferences = PrefModel.locationFeaturesPreferences;
    String? paymentPreferences = PrefModel.paymentPreferences;
    String? relationshipPreferences = PrefModel.relationshipPreferences;
    String? radiusPreferences = PrefModel.radiusPreferences;
    String? ambianceDensityPreferences = PrefModel.ambianceDensityPreferences;

    return Scaffold(
      appBar: AppBar(
        // Back button leads to profile side menu screen
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            iconSize: 30.0,
            //color: Colors.blue,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => MainScreen(),
                ),
                    (Route route) => false,
              );
            }),

         title: Text('My Preferences'),
      ),
      body: Center(
        child: ListView(
          //Row (
          children: <Widget>[
            //Row (
            //Text('Update your preferences'),
            // Budget button and preferences
            Row(
              children: <Widget>[
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
                  child: const Text('Budget', style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: Text('$budgetPreferences'),
                ),
              ],
            ),
            // Commute button and preferences
            Row(
              children: <Widget>[
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => PrefCommuteScreen(),
                      ),
                      (Route route) => false,
                    );
                  },
                  child: const Text('Commute', style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: Text('$commutePreferences'),
                ),
              ],
            ),
            // Cuisine button and preferences
            Row(
              children: <Widget>[
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => PrefCuisineScreen(),
                      ),
                      (Route route) => false,
                    );
                  },
                  child: const Text('Cuisine', style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: Text('$cuisinePreferences'),
                ),
              ],
            ),
            // Health and Covid button and preferences
            Row(
              children: <Widget>[
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            PrefHealthCovidScreen(),
                      ),
                      (Route route) => false,
                    );
                  },
                  child: const Text('Health, Safety, and Covid', style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: Text('$healthCovidPreferences'),
                ),
              ],
            ),
            // Ambiance and Density button and preferences
            Row(
              children: <Widget>[
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            PrefAmbiDensiScreen(),
                      ),
                      (Route route) => false,
                    );
                  },
                  child: const Text('Ambiance & Density',
                      style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: Text('$ambianceDensityPreferences'),
                ),
              ],
            ),
            // Diet button and preferences
            Row(
              children: <Widget>[
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => PrefDietScreen(),
                      ),
                      (Route route) => false,
                    );
                  },
                  child: const Text('Diet', style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: Text('$dietPreferences'),
                ),
              ],
            ),
            // Location Features button and preferences
            Row(
              children: <Widget>[
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            PrefLocationFeaturesScreen(),
                      ),
                      (Route route) => false,
                    );
                  },
                  child: const Text('Location Features',
                      style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: Text('$locationFeaturesPreferences'),
                ),
              ],
            ),
            // General Features button and preferences
            Row(
              children: <Widget>[
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => PrefFeaturesScreen(),
                      ),
                      (Route route) => false,
                    );
                  },
                  child: const Text('General Features',
                      style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: Text('$generalFeaturesPreferences'),
                ),
              ],
            ),
            // Local Spot Features button and preferences
            Row(
              children: <Widget>[
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            PrefLocalSpotScreen(),
                      ),
                      (Route route) => false,
                    );
                  },
                  child:
                      const Text('Local Spot', style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: Text('$localSpotPreferences'),
                ),
              ],
            ),
            // Relationship status button and preferences
            Row(
              children: <Widget>[
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => PrefRelatScreen(),
                      ),
                      (Route route) => false,
                    );
                  },
                  child: const Text('Relationship Status',
                      style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: Text('$relationshipPreferences'),
                ),
              ],
            ),
            // Multiple Itineraries button and preferences
            Row(
              children: <Widget>[
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            PrefMultiPlanScreen(),
                      ),
                      (Route route) => false,
                    );
                  },
                  child: const Text('Multiple Itineraries',
                      style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: Text('$multiplePlansPreferences'),
                  
                ),
              ],
            ),
            // Payments button and preferences
            Row(
              children: <Widget>[
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => PrefPaymentsScreen(),
                      ),
                      (Route route) => false,
                    );
                  },
                  child: const Text('Payment Methods',
                      style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: Text('$paymentPreferences'),
                ),
              ],
            ),
            // Radius button and preferences
            Row(
              children: <Widget>[
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => PrefRadiusScreen(),
                      ),
                      (Route route) => false,
                    );
                  },
                  child: const Text('Location and Radius', style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: Text('$radiusPreferences'),
                ),
              ],
            ),
            // Tune Preferences Button
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PrefMultiPlanScreen(),
                  ),
                  (Route route) => false,
                );
              },
              child: const Text('Tune Preferences',
                  style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.arrow_downward),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
