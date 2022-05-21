import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:planzapp/Views/Home/MainScreen.dart';
import 'package:planzapp/Views/Preferences/PreferencesScreen.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:planzapp/Services/Preferences/PrefUpdateService.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:planzapp/Models/Preferences/PrefModel.dart';
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart'
    as Controllers;
import 'package:planzapp/Views/Preferences/PrefCommuteScreen.dart';
import 'package:planzapp/Views/Preferences/PrefRadiusScreen.dart';
import 'package:planzapp/Views/Preferences/PrefFeaturesScreen.dart';
import 'package:planzapp/Controllers/Preferences/IntimateController.dart';
import 'package:planzapp/Controllers/Preferences/AverageDensityController.dart';
import 'package:planzapp/Controllers/Preferences/ComfyController.dart';
import 'package:planzapp/Controllers/Preferences/AboveAverageDensityController.dart';
import 'package:planzapp/Controllers/Preferences/PackedCrowdsController.dart';
import 'package:planzapp/Controllers/Preferences/AnyDensityController.dart';
import 'package:planzapp/Controllers/Preferences/SocialDistanceController.dart';

class PrefAmbiDensiScreen extends StatefulWidget {
  @override
  _PrefAmbiDensiScreen createState() => _PrefAmbiDensiScreen();
}

class _PrefAmbiDensiScreen extends State<PrefAmbiDensiScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User loggedInUser;

  @override
  void initState() {
    super.initState();
    debugPrint("Ambiance and Density Preferences Page");
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
        title: Text('Density & Ambiance Preferences'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                        'planzApp requires this information so we can better match you to locations that fit your density and ambiance preferences.'),
                  ),
                  IconButton(
                    icon: Icon(Icons.info_rounded),
                    iconSize: 15.0,
                    onPressed: () {},
                  ),
                ],
              ),
              // Intimate and Average Checkboxes
              Row(children: <Widget>[
                // Intimate Check box
                //   Consumer<PreferencesModel>(
                //   builder: (context,dbIntimate, child) =>
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Intimate',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbIntimate,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleIntimate();
                      setState(() {
                        PrefModel.dbIntimate = newValue;
                      });
                      if (PrefModel.dbIntimate == false) {
                        setState(() {
                          PrefModel.dbAnyDensity = false;
                        });
                        AnyDensityController().run(PrefModel.dbAnyDensity);
                      } else if (PrefModel.dbIntimate == true) {
                        setState(() {
                          PrefModel.dbResetAmbiDensityValue = false;
                        });
                        AnyDensityController().run(PrefModel.dbAnyDensity);
                      }
                      // save user intimate setting preference
                      IntimateController().run(PrefModel.dbIntimate);
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

                // Average checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Average',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbAverageDensity,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleAverageDensity();
                      setState(() {
                        PrefModel.dbAverageDensity = newValue;
                      });
                      if (PrefModel.dbAverageDensity == false) {
                        setState(() {
                          PrefModel.dbAnyDensity = false;
                        });

                        AnyDensityController().run(PrefModel.dbAnyDensity);
                      } else if (PrefModel.dbAverageDensity == true) {
                        setState(() {
                          PrefModel.dbResetAmbiDensityValue = false;
                        });
                        AnyDensityController().run(PrefModel.dbAnyDensity);
                      }
                      // save user average density preferences
                      AverageDensityController()
                          .run(PrefModel.dbAverageDensity);
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
                  // Comfy Checkbox
                  children: <Widget>[
                    Expanded(
                      child: LabeledCheckbox(
                        label: 'Comfy',
                        //tristate: true,
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        value: PrefModel.dbComfy,
                        onChanged: (bool newValue) {
                          context.read<PreferencesModel>().toggleComfy();
                          setState(() {
                            PrefModel.dbComfy = newValue;
                          });
                          if (PrefModel.dbComfy == false) {
                            setState(() {
                              PrefModel.dbAnyDensity = false;
                            });
                            AnyDensityController().run(PrefModel.dbAnyDensity);
                          } else if (PrefModel.dbComfy = true) {
                            setState(() {
                              PrefModel.dbResetAmbiDensityValue = false;
                            });
                            AnyDensityController().run(PrefModel.dbAnyDensity);
                          }
                          // save user comfy preferences
                          ComfyController().run(PrefModel.dbComfy);
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

                    //Above Average Density Checkbox
                    Expanded(
                      child: LabeledCheckbox(
                        label: 'Above Average',
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        value: PrefModel.dbAboveAverageDensity,
                        onChanged: (bool newValue) {
                          context
                              .read<PreferencesModel>()
                              .toggleAboveAverageDensity();
                          setState(() {
                            PrefModel.dbAboveAverageDensity = newValue;
                          });
                          if (PrefModel.dbAboveAverageDensity == false) {
                            setState(() {
                              PrefModel.dbAnyDensity = false;
                            });
                            AnyDensityController().run(PrefModel.dbAnyDensity);
                          } else if (PrefModel.dbAboveAverageDensity == true) {
                            setState(() {
                              PrefModel.dbResetAmbiDensityValue = false;
                            });
                            // AnyDensityController().run(PrefModel.dbAnyDensity);
                          }
                          // save user above average density preference
                          AboveAverageDensityController()
                              .run(PrefModel.dbAboveAverageDensity);
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
                // Packed crowd preferences Checkbox
                Expanded(
                  child: LabeledCheckbox(
                    //tristate: true,
                    label: 'Packed (Crowds)',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbPackedCrowds,
                    onChanged: (newValue) {
                      context.read<PreferencesModel>().togglePackedCrowds();
                      setState(() {
                        PrefModel.dbPackedCrowds = newValue;
                      });
                      if (PrefModel.dbPackedCrowds == false) {
                        setState(() {
                          PrefModel.dbAnyDensity = false;
                        });
                        AnyDensityController().run(PrefModel.dbAnyDensity);
                      } else if (PrefModel.dbPackedCrowds = true) {
                        setState(() {
                          PrefModel.dbResetAmbiDensityValue = false;
                        });
                        AnyDensityController().run(PrefModel.dbAnyDensity);
                      }
                      // save user packed crowds preferences
                      PackedCrowdsController().run(PrefModel.dbPackedCrowds);
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
                // Social Distancing preferences Checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'I am practicing social distancing',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbSocialDistance,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleSocialDistance();
                      setState(() {
                        PrefModel.dbSocialDistance = newValue;
                      });
                      if (PrefModel.dbSocialDistance == false) {
                        setState(() {
                          PrefModel.dbAnyDensity = false;
                        });
                        AnyDensityController().run(PrefModel.dbAnyDensity);
                      } else if (PrefModel.dbSocialDistance == true) {
                        setState(() {
                          PrefModel.dbResetAmbiDensityValue = false;
                        });
                        AnyDensityController().run(PrefModel.dbAnyDensity);
                      }
                      // save user social distancing preferences
                      SocialDistanceController()
                          .run(PrefModel.dbSocialDistance);
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
                // Any density Checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Any',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel
                        .dbAnyDensity, // dbAnyDensity is just a boolean that has not been initialized
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleAnyDensity();
                      setState(() {
                        PrefModel.dbAnyDensity = newValue;
                      });
                      if (PrefModel.dbAnyDensity == true) {
                        setState(() {
                          PrefModel.dbIntimate = newValue;
                          PrefModel.dbAverageDensity = newValue;
                          PrefModel.dbComfy = newValue;
                          PrefModel.dbAboveAverageDensity = newValue;
                          PrefModel.dbPackedCrowds = newValue;
                          PrefModel.dbSocialDistance = newValue;
                          PrefModel.dbResetAmbiDensityValue = false;
                        });
                      } else {
                        //if ( PrefModel.dbAnyDensity == false) does not work properly on the app
                        setState(() {
                          PrefModel.dbIntimate = false;
                          PrefModel.dbAverageDensity = false;
                          PrefModel.dbComfy = false;
                          PrefModel.dbAboveAverageDensity = false;
                          PrefModel.dbPackedCrowds = false;
                          PrefModel.dbSocialDistance = false;
                          PrefModel.dbResetAmbiDensityValue = false;
                        });
                      }
                      // save user any density preferences
                      AnyDensityController().run(PrefModel.dbAnyDensity);
                      SocialDistanceController()
                          .run(PrefModel.dbSocialDistance);
                      IntimateController().run(PrefModel.dbIntimate);
                      AverageDensityController()
                          .run(PrefModel.dbAverageDensity);
                      ComfyController().run(PrefModel.dbComfy);
                      AboveAverageDensityController()
                          .run(PrefModel.dbAboveAverageDensity);
                      PackedCrowdsController().run(PrefModel.dbPackedCrowds);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Reset checkbox
                Expanded(
                  child: RaisedButton(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    onPressed: () {
                      context
                          .read<PreferencesModel>()
                          .toggleResetAmbiDensityValue();

                      setState(() {
                        PrefModel.dbIntimate = false;
                        PrefModel.dbAverageDensity = false;
                        PrefModel.dbComfy = false;
                        PrefModel.dbAboveAverageDensity = false;
                        PrefModel.dbPackedCrowds = false;
                        PrefModel.dbSocialDistance = false;
                        PrefModel.dbAnyDensity = false;
                      });
                      AnyDensityController().run(PrefModel.dbAnyDensity);

                      // save user social distancing preferences
                      AnyDensityController().run(PrefModel.dbAnyDensity);
                      SocialDistanceController()
                          .run(PrefModel.dbSocialDistance);
                      IntimateController().run(PrefModel.dbIntimate);
                      AverageDensityController()
                          .run(PrefModel.dbAverageDensity);
                      ComfyController().run(PrefModel.dbComfy);
                      AboveAverageDensityController()
                          .run(PrefModel.dbAboveAverageDensity);
                      PackedCrowdsController().run(PrefModel.dbPackedCrowds);
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
                      builder: (BuildContext context) => PrefFeaturesScreen(),
                    ),
                    (Route route) => false,
                  );
                },
                child: const Text('NEXT (Features)',
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
