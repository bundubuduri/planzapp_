import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:planzapp/Views/Home/MainScreen.dart';
import 'package:planzapp/Views/Preferences/PreferencesScreen.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:planzapp/Services/Preferences/PrefUpdateService.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:planzapp/Models/Preferences/PrefModel.dart';
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart'
    as Controllers;
import 'package:planzapp/Controllers/Preferences/LocallyOwnedController.dart';
import 'package:planzapp/Controllers/Preferences/LocallySourcedController.dart';
import 'package:planzapp/Controllers/Preferences/AnyLocalSpotController.dart';
import 'package:planzapp/Views/Preferences/PrefCommuteScreen.dart';
import 'package:planzapp/Views/Preferences/PrefPaymentsScreen.dart';
import 'package:planzapp/Views/Preferences/PrefLocationFeaturesScreen.dart';

class PrefLocalSpotScreen extends StatefulWidget {
  @override
  _PrefLocalSpotScreen createState() => _PrefLocalSpotScreen();
}

class _PrefLocalSpotScreen extends State<PrefLocalSpotScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User loggedInUser;

  @override
  void initState() {
    super.initState();
    print("Local Spot Preferences page opened");
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
        title: Text('Local Spot Preferences'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                        'planzApp requires this information so we can better match you to Businesses & Locations that are sourced locally and locally owned.'),
                  ),
                  IconButton(
                    icon: Icon(Icons.info_rounded),
                    iconSize: 15.0,
                    onPressed: () {},
                  ),
                ],
              ),
              Row(children: <Widget>[
                // LocallySourced Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Locally Sourced',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbLocallySourced,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleLocallySourced();
                      setState(() {
                        PrefModel.dbLocallySourced = newValue;
                      });
                      if (PrefModel.dbLocallySourced == false) {
                        setState(() {
                          PrefModel.dbAllLocalSpot = false;
                        });
                        AnyLocalSpotController().run(PrefModel.dbAllLocalSpot);
                      } else {
                        setState(() {
                          PrefModel.dbResetLocalSpotValue = false;
                        });
                        AnyLocalSpotController().run(PrefModel.dbAllLocalSpot);
                      }
                      // save user Locally Sourced setting preference
                      LocallySourcedController()
                          .run(PrefModel.dbLocallySourced);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.info_rounded),
                    iconSize: 18.0,
                    onPressed: () {},
                  ),
                ),

                // LocallyOwned checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Locally Owned',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbLocallyOwned,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleLocallyOwned();
                      setState(() {
                        PrefModel.dbLocallyOwned = newValue;
                      });
                      if (PrefModel.dbLocallyOwned == false) {
                        setState(() {
                          PrefModel.dbAllLocalSpot = false;
                        });
                        AnyLocalSpotController().run(PrefModel.dbAllLocalSpot);
                      } else {
                        setState(() {
                          PrefModel.dbResetLocalSpotValue = false;
                        });
                        AnyLocalSpotController().run(PrefModel.dbAllLocalSpot);
                      }
                      // save user Locally Owned preferences
                      LocallyOwnedController().run(PrefModel.dbLocallyOwned);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.info_rounded),
                    iconSize: 18.0,
                    onPressed: () {},
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Any Local Spot checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'All',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbAllLocalSpot,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleAnyLocalSpot();
                      setState(() {
                        PrefModel.dbAllLocalSpot = newValue;
                      });
                      if (PrefModel.dbAllLocalSpot == true) {
                        setState(() {
                          PrefModel.dbLocallyOwned = true;
                          PrefModel.dbLocallySourced = true;
                          PrefModel.dbResetLocalSpotValue = false;
                        });
                        LocallyOwnedController().run(PrefModel.dbAllLocalSpot);
                        LocallySourcedController()
                            .run(PrefModel.dbAllLocalSpot);
                      } else {
                        setState(() {
                          PrefModel.dbLocallyOwned = false;
                          PrefModel.dbLocallySourced = false;
                        });
                        LocallyOwnedController().run(PrefModel.dbAllLocalSpot);
                        LocallySourcedController()
                            .run(PrefModel.dbAllLocalSpot);
                      }
                      // save user AnyLocalSpot preferences
                      AnyLocalSpotController().run(PrefModel.dbAllLocalSpot);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                //Reset checkbox
                Expanded(
                  child: RaisedButton(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    onPressed: () {
                      context
                          .read<PreferencesModel>()
                          .toggleResetLocalSpotValue();
                      setState(() {
                        PrefModel.dbLocallyOwned = false;
                        PrefModel.dbLocallySourced = false;
                        PrefModel.dbAllLocalSpot = false;
                      });
                      LocallyOwnedController().run(PrefModel.dbAllLocalSpot);
                      LocallySourcedController().run(PrefModel.dbAllLocalSpot);

                      // save user AnyLocalSpot preferences
                      AnyLocalSpotController().run(PrefModel.dbAllLocalSpot);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                    child: Text('Reset', style: TextStyle(fontSize: 15)),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.info_rounded),
                    iconSize: 18.0,
                    onPressed: () {},
                  ),
                ),
              ]),
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
                child: const Text('NEXT (Payments)',
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
