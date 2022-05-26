

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
import 'package:planzapp/Views/Preferences/PrefHealthCovidScreen.dart';
import 'package:planzapp/Views/Preferences/PrefLocationFeaturesScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart' as Controllers;
import 'package:planzapp/Controllers/Preferences/SingleController.dart';
import 'package:planzapp/Controllers/Preferences/MarriedController.dart';
import 'package:planzapp/Controllers/Preferences/InARelationshipController.dart';
import 'package:planzapp/Controllers/Preferences/AnyRelationshipController.dart';


class PrefRelatScreen extends StatefulWidget {
  @override
  _PrefRelatScreen createState() => _PrefRelatScreen();
}

class _PrefRelatScreen extends State<PrefRelatScreen> {

  final _firestore =  FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User? loggedInUser;

  @override
  void initState() {
    super.initState();
    debugPrint("Preference relationships page opened.");
    getCurrentUser();
  }

  void getCurrentUser() async {
    loggedInUser = await GetUserController().run();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var PrefModel =  Provider.of<PreferencesModel>(context);

    return Scaffold(
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
          title: Text('Relationship Preferences'),
        ),
        body: Builder (
          builder: (context) =>
          Center(
          child: ListView (
            children: <Widget>[

              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('planzApp requires this information so we can better match you to experiences tailored to your relationship status'),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.info_rounded),
                      iconSize: 15.0,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
                
              Row (
                children: <Widget>[
                  
                  // Single Check box
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Single',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbSingle,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleSingle();
                        setState(() {
                            PrefModel.dbSingle = newValue;
                        });
                        if (PrefModel.dbSingle == false){
                          setState(() {
                              PrefModel.dbAnyRelationship = newValue;
                          });
                          AnyRelationshipController().run(PrefModel.dbAnyRelationship!);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetRelatValue = false;
                          });
                          AnyRelationshipController().run(PrefModel.dbAnyRelationship!);
                        }
                        // save user Single preference
                        SingleController().run(PrefModel.dbSingle!);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),

                  // Married checkbox
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Married',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbMarried,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleMarried();
                        setState(() {
                            PrefModel.dbMarried = newValue;
                        });
                        if (PrefModel.dbMarried == false){
                          setState(() {
                              PrefModel.dbAnyRelationship = newValue;
                          });
                          AnyRelationshipController().run(PrefModel.dbAnyRelationship!);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetRelatValue = false;
                          });
                          AnyRelationshipController().run(PrefModel.dbAnyRelationship!);
                        }
                        // save user Married preferences
                        MarriedController().run(PrefModel.dbMarried!);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),
                  ]
                ),

                Row (
                  children: <Widget>[

                    // In A Relationship Check box
                    Expanded(
                    child: LabeledCheckbox(
                      label: 'In A Relationship',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbInARelationship,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleInARelationship();
                        setState(() {
                            PrefModel.dbInARelationship = newValue;
                        });
                        if (PrefModel.dbInARelationship == false){
                          setState(() {
                              PrefModel.dbAnyRelationship = newValue;
                          });
                          AnyRelationshipController().run(PrefModel.dbAnyRelationship!);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetRelatValue = false;
                          });
                          AnyRelationshipController().run(PrefModel.dbAnyRelationship!);
                        }
                        // save user In A Relationship preference
                        InARelationshipController().run(PrefModel.dbInARelationship!);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),

                    // In A Relationship Check box
                    Expanded(
                      child: LabeledCheckbox(
                        label: 'Any Relationship Status',
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        value: PrefModel.dbAnyRelationship,
                        onChanged: (bool newValue) {
                          context.read<PreferencesModel>().toggleAnyRelationship();
                          setState(() {
                            PrefModel.dbAnyRelationship = newValue;
                          });
                          if (PrefModel.dbAnyRelationship == true){
                            setState(() {
                              PrefModel.dbSingle = newValue;
                              PrefModel.dbMarried = newValue;
                              PrefModel.dbInARelationship = newValue;
                              PrefModel.dbResetRelatValue = false;
                            });
                            SingleController().run(PrefModel.dbSingle!);
                            MarriedController().run(PrefModel.dbMarried!);
                            InARelationshipController().run(PrefModel.dbInARelationship!);
                          }
                          else{
                            setState(() {
                              PrefModel.dbSingle = false;
                              PrefModel.dbMarried = false;
                              PrefModel.dbInARelationship = false;
                            });
                            SingleController().run(PrefModel.dbSingle!);
                            MarriedController().run(PrefModel.dbMarried!);
                            InARelationshipController().run(PrefModel.dbInARelationship!);
                          }
                          // save user In A Relationship preference
                          AnyRelationshipController().run(PrefModel.dbAnyRelationship!);
                          // Notify user preference saved
                          UpdatingSnackbar.showMessage(context);
                        },
                      ),
                    ),

                    //Reset checkboxes
                    Expanded(
                        child: RaisedButton(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          onPressed: () {
                            context.read<PreferencesModel>().toggleResetRelatValue();

                              setState(() {
                                PrefModel.dbSingle = false;
                                PrefModel.dbMarried = false;
                                PrefModel.dbInARelationship = false;
                                PrefModel.dbAnyRelationship = false;
                              });
                              SingleController().run(PrefModel.dbSingle!);
                              MarriedController().run(PrefModel.dbMarried!);
                              InARelationshipController().run(PrefModel.dbInARelationship!);

                            // save user In A Relationship preference
                            AnyRelationshipController().run(PrefModel.dbAnyRelationship!);
                            // Notify user preference saved
                            UpdatingSnackbar.showMessage(context);
                        },
                          child: Text('Reset', style: TextStyle(fontSize: 15)),
                        ),
                    ),

                  ]
                ),


              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PrefLocationFeaturesScreen(),
                    ),
                    (Route route) => false,
                );},
                child: const Text('NEXT (Location Features)', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
      );
    }
  }
