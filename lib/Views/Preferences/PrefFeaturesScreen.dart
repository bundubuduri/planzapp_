import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:planzapp/Models/Preferences/PrefModel.dart';
import 'package:planzapp/Views/Home/MainScreen.dart';
import 'package:planzapp/Views/Preferences/PreferencesScreen.dart';
import 'package:planzapp/Views/Preferences/PrefCommuteScreen.dart';
import 'package:planzapp/Views/Preferences/PrefRadiusScreen.dart';
import 'package:planzapp/Views/Preferences/PrefAmbiDensiScreen.dart';
import 'package:planzapp/Views/Preferences/PrefCuisineScreen.dart';
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart'
    as Controllers;
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:planzapp/Controllers/Preferences/MatchDietController.dart';
import 'package:planzapp/Controllers/Preferences/MatchDensityController.dart';
import 'package:planzapp/Controllers/Preferences/MatchCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/GoodForCouplesController.dart';
import 'package:planzapp/Controllers/Preferences/MatchPaymentController.dart';
import 'package:planzapp/Controllers/Preferences/ReqRSVPController.dart';
import 'package:planzapp/Controllers/Preferences/Groups5PlusController.dart';
import 'package:planzapp/Controllers/Preferences/MatchBudgetController.dart';
import 'package:planzapp/Controllers/Preferences/WaitTimeController.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:planzapp/Services/Preferences/PrefUpdateService.dart';

class PrefFeaturesScreen extends StatefulWidget {
  @override
  _PrefFeaturesScreen createState() => _PrefFeaturesScreen();
}

class _PrefFeaturesScreen extends State<PrefFeaturesScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User? loggedInUser;

  @override
  void initState() {
    super.initState();
    debugPrint("Feature Preferences page opened");
    getCurrentUser();
  }

  void getCurrentUser() async {
    loggedInUser = await GetUserController().run();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var PrefModel = Provider.of<PreferencesModel>(context);
    int sliderWaitTime = PrefModel.dbWaitTime!.toInt();
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
        title: Text('Features Preferences'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                        'planzApp requires this information so we can better match you to Businesses & Locations that match your preferences.'),
                  ),
                  IconButton(
                    icon: Icon(Icons.info_rounded),
                    iconSize: 15.0,
                    onPressed: () {},
                  ),
                ],
              ),
              Row(children: <Widget>[
                // Match Diet Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Match my Diet',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbMatchDiet,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleMatchDiet();
                      setState(() {
                        PrefModel.dbMatchDiet = newValue;
                      });
                      // save user Match Diet setting preference
                      MatchDietController().run(PrefModel.dbMatchDiet!);
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

                // MatchCuisine checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Match my Cuisine preferences',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbMatchCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleMatchCuisine();
                      setState(() {
                        PrefModel.dbMatchCuisine = newValue;
                      });
                      // save user match cuisine preferences
                      MatchCuisineController().run(PrefModel.dbMatchCuisine!);
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
              Row(
                  // MatchDensity Checkbox
                  children: <Widget>[
                    Expanded(
                      child: LabeledCheckbox(
                        label: 'Match my Density preferences',
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        value: PrefModel.dbMatchDensity,
                        onChanged: (bool newValue) {
                          context.read<PreferencesModel>().toggleMatchDensity();
                          setState(() {
                            PrefModel.dbMatchDensity = newValue;
                          });
                          // save user match density preferences
                          MatchDensityController()
                              .run(PrefModel.dbMatchDensity!);
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

                    // Good for couples Checkbox
                    Expanded(
                      child: LabeledCheckbox(
                        label: 'Good for couples',
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        value: PrefModel.dbGoodForCouples,
                        onChanged: (bool newValue) {
                          context
                              .read<PreferencesModel>()
                              .toggleGoodForCouples();
                          setState(() {
                            PrefModel.dbGoodForCouples = newValue;
                          });
                          // save user good for couples preference
                          GoodForCouplesController()
                              .run(PrefModel.dbGoodForCouples!);
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
                // Groups of 5 plus preferences Checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Groups of 5+',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbGroups5Plus,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleGroups5Plus();
                      setState(() {
                        PrefModel.dbGroups5Plus = newValue;
                      });
                      // save user groups of 5 plus preferences
                      Groups5PlusController().run(PrefModel.dbGroups5Plus!);
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
                // Match Payment Preference Checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Match my Payment Methods',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbMatchPayment,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleMatchPayment();
                      setState(() {
                        PrefModel.dbMatchPayment = newValue;
                      });
                      // save user match payment preferences
                      MatchPaymentController().run(PrefModel.dbMatchPayment!);
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
                // Social Distancing preferences Checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Match my Budget',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbMatchBudget,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleMatchBudget();
                      setState(() {
                        PrefModel.dbMatchBudget = newValue;
                      });
                      // save user match budget preferences
                      MatchBudgetController().run(PrefModel.dbMatchBudget!);
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
                // Requires RSVP preferences Checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Requires RSVP',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbReqRSVP,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleReqRSVP();
                      setState(() {
                        PrefModel.dbReqRSVP = newValue;
                      });
                      // save user require rsvp preferences
                      ReqRSVPController().run(PrefModel.dbReqRSVP!);
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
                Expanded(
                  child: Text('$sliderWaitTime Wait Time (in Minutes)',
                      textAlign: TextAlign.center),
                )
              ]),
              Row(children: <Widget>[
                Expanded(
                  child: Slider(
                    value: PrefModel.dbWaitTime!,
                    min: 0,
                    max: 120,
                    divisions: 24,
                    label: PrefModel.dbWaitTime!.round().toString() +
                        "/Preferences/Preferences",
                    onChanged: (double value) {
                      context.read<PreferencesModel>().changeWaitTime(value);
                      setState(() {
                        PrefModel.dbWaitTime = value;
                      });
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                    onChangeEnd: (double value) {
                      // save user wait time preferences
                      WaitTimeController().run(PrefModel.dbWaitTime!);
                    },
                  ),
                ),
              ]),
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
                child: const Text('NEXT (Cuisine)',
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
