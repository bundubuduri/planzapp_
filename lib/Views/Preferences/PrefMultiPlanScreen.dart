import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:planzapp/Models/Preferences/PrefModel.dart';
import 'package:planzapp/Views/Home/MainScreen.dart';
import 'package:planzapp/Views/Authentication/Signin_screen.dart';
import 'package:planzapp/Views/Preferences/PreferencesScreen.dart';
import 'package:planzapp/Views/Preferences/PrefCommuteScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart'
    as Controllers;
import 'package:planzapp/Controllers/Preferences/MultiplePlansController.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:planzapp/Services/Preferences/PrefUpdateService.dart';

class PrefMultiPlanScreen extends StatefulWidget {
  @override
  _PrefMultiPlanScreen createState() => _PrefMultiPlanScreen();
}

class _PrefMultiPlanScreen extends State<PrefMultiPlanScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User? loggedInUser;

  @override
  void initState() {
    super.initState();
    print("Multiple Plans Preferences page opened");
    getCurrentUser();
  }

  void getCurrentUser() async {
    loggedInUser = await GetUserController().run();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var PrefModel = Provider.of<PreferencesModel>(context);
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
        // Settings button
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
        title: Text('Preferences (Multiple Plans)'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: ListView(
            children: <Widget>[
              Text(
                  'If yes, you will be added to plans that have multiple locations and/ or itineraries'),
              Row(children: <Widget>[
                Center(
                  child: Text(
                      'Add me to plans with Multiple Locations or Itineraries',
                      textAlign: TextAlign.left),
                ),
                // Button to allow multpile plans
                Center(
                  child: Switch(
                    value: PrefModel.dbMultiplePlans!,
                    onChanged: (value) {
                      context.read<PreferencesModel>().toggleMultiplePlans();
                      setState(() {
                        PrefModel.dbMultiplePlans = value;
                      });
                      // save user multiple plan preferences
                      MultiplePlansController().run(PrefModel.dbMultiplePlans!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
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
                child: const Text('NEXT (Commute)',
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
