import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:planzapp/util/universalMethods.dart';
import 'package:planzapp/Models/Preferences/PrefModel.dart';
import 'package:planzapp/Views/Authentication/Signin_screen.dart';
import 'package:planzapp/Views/Home/MainScreen.dart';
import 'package:planzapp/Views/Preferences/PrefMultiPlanScreen.dart';
import 'package:planzapp/Views/Preferences/PrefRadiusScreen.dart';
import 'package:planzapp/Views/Preferences/PreferencesScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart'
    as Controllers;
import 'package:planzapp/Controllers/Preferences/RideShareController.dart';
import 'package:planzapp/Controllers/Preferences/DriveController.dart';
import 'package:planzapp/Controllers/Preferences/FlightController.dart';
import 'package:planzapp/Controllers/Preferences/TrainController.dart';
import 'package:planzapp/Controllers/Preferences/PublicBusMetroController.dart';
import 'package:planzapp/Controllers/Preferences/AnyCommuteController.dart';
import 'package:planzapp/Controllers/Preferences/WalkController.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:planzapp/Services/Preferences/PrefUpdateService.dart';

class PrefCommuteScreen extends StatefulWidget {
  @override
  _PrefCommuteScreen createState() => _PrefCommuteScreen();
}

class _PrefCommuteScreen extends State<PrefCommuteScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User loggedInUser;

  @override
  void initState() {
    super.initState();
    print('Commute Preferences Screen Opened');
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
          title: Text('Commute Preferences'),
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
          ]),
      body: Builder(
        builder: (context) => Center(
          child: ListView(
            children: <Widget>[
              Text(
                  'planzApp requires this information so we can better match you to experiences that are favorable to your preferred commute'),
              //add the gage for the distance.
              Column(children: <Widget>[
                
              ]

              ),
              
              // RideShare and Drive Checkboxes
              Row(children: <Widget>[
                // Ride Share Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Ride Share',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbRideShare,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleRideShare();
                      setState(() {
                        PrefModel.dbRideShare = newValue;
                      });
                      if (PrefModel.dbRideShare == false) {
                        setState(() {
                          PrefModel.dbAnyCommute = false;
                          AnyCommuteController().run(PrefModel.dbAnyCommute);
                        });
                      } else {
                        setState(() {
                          PrefModel.dbResetCommuteValue = false;
                          AnyCommuteController().run(PrefModel.dbAnyCommute);
                        });
                      }
                      // save user ride share preferences
                      RideShareController().run(PrefModel.dbRideShare);
                      // Shows user "preference saved"
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Drive checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Drive',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbDrive,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleDrive();
                      setState(() {
                        PrefModel.dbDrive = newValue;
                      });
                      if (PrefModel.dbDrive == false) {
                        setState(() {
                          PrefModel.dbAnyCommute = false;
                          AnyCommuteController().run(PrefModel.dbAnyCommute);
                        });
                      } else {
                        setState(() {
                          PrefModel.dbResetCommuteValue = false;
                        });
                      }
                      // save user driving preferences
                      DriveController().run(PrefModel.dbDrive);
                      // Shows user "preference saved"
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),

              Row(
                  //Flight Checkbox
                  children: <Widget>[
                    Expanded(
                      child: LabeledCheckbox(
                        label: 'Flight',
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        value: PrefModel.dbFlight,
                        onChanged: (bool newValue) {
                          context.read<PreferencesModel>().toggleFlight();
                          setState(() {
                            PrefModel.dbFlight = newValue;
                          });
                          if (PrefModel.dbFlight == false) {
                            setState(() {
                              PrefModel.dbAnyCommute = false;
                              AnyCommuteController()
                                  .run(PrefModel.dbAnyCommute);
                            });
                          } else {
                            setState(() {
                              PrefModel.dbResetCommuteValue = false;
                              AnyCommuteController()
                                  .run(PrefModel.dbAnyCommute);
                            });
                          }
                          // save user flight preferences
                          FlightController().run(PrefModel.dbFlight);
                          // Shows user "preference saved"
                          UpdatingSnackbar.showMessage(context);
                        },
                      ),
                    ),

                    //Train Checkbox
                    Expanded(
                      child: LabeledCheckbox(
                        label: 'Train & Metro',
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        value: PrefModel.dbTrain,
                        onChanged: (bool newValue) {
                          context.read<PreferencesModel>().toggleTrain();
                          setState(() {
                            PrefModel.dbTrain = newValue;
                          });
                          if (PrefModel.dbTrain == false) {
                            setState(() {
                              PrefModel.dbAnyCommute = false;
                              AnyCommuteController()
                                  .run(PrefModel.dbAnyCommute);
                            });
                          } else {
                            setState(() {
                              PrefModel.dbResetCommuteValue = false;
                              AnyCommuteController()
                                  .run(PrefModel.dbAnyCommute);
                            });
                          }
                          // save user train preferences
                          TrainController().run(PrefModel.dbTrain);
                          // Shows user "preference saved"
                          UpdatingSnackbar.showMessage(context);
                        },
                      ),
                    ),
                  ]),
              Row(children: <Widget>[
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Bus',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbPublicBusMetro,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().togglePublicBusMetro();
                      setState(() {
                        PrefModel.dbPublicBusMetro = newValue;
                      });
                      if (PrefModel.dbPublicBusMetro == false) {
                        setState(() {
                          PrefModel.dbAnyCommute = false;
                          AnyCommuteController().run(PrefModel.dbAnyCommute);
                        });
                      } else {
                        setState(() {
                          PrefModel.dbResetCommuteValue = false;
                          AnyCommuteController().run(PrefModel.dbAnyCommute);
                        });
                      }
                      // save user public transportation preferences
                      PublicBusMetroController()
                          .run(PrefModel.dbPublicBusMetro);
                      // Shows user "preference saved"
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Walk (Bikes & Scooters)',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbWalk,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleWalk();
                      setState(() {
                        PrefModel.dbWalk = newValue;
                      });
                      if (PrefModel.dbWalk == false) {
                        setState(() {
                          PrefModel.dbAnyCommute = false;
                          AnyCommuteController().run(PrefModel.dbAnyCommute);
                        });
                      } else {
                        setState(() {
                          PrefModel.dbResetCommuteValue = false;
                          AnyCommuteController().run(PrefModel.dbAnyCommute);
                        });
                      }
                      // save user walking preferences
                      WalkController().run(PrefModel.dbWalk);
                      // Shows user "preference saved"
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Any Commute',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbAnyCommute,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleAnyCommute();
                      setState(() {
                        PrefModel.dbAnyCommute = newValue;
                      });
                      if (PrefModel.dbAnyCommute == true) {
                        setState(() {
                          PrefModel.dbRideShare = newValue;
                          PrefModel.dbDrive = newValue;
                          PrefModel.dbFlight = newValue;
                          PrefModel.dbTrain = newValue;
                          PrefModel.dbPublicBusMetro = newValue;
                          PrefModel.dbWalk = newValue;
                          PrefModel.dbResetCommuteValue = false;
                        });
                        RideShareController().run(PrefModel.dbRideShare);
                        FlightController().run(PrefModel.dbFlight);
                        TrainController().run(PrefModel.dbTrain);
                        PublicBusMetroController()
                            .run(PrefModel.dbPublicBusMetro);
                        WalkController().run(PrefModel.dbWalk);
                        DriveController().run(PrefModel.dbDrive);
                      } else {
                        setState(() {
                          PrefModel.dbRideShare = false;
                          PrefModel.dbDrive = false;
                          PrefModel.dbFlight = false;
                          PrefModel.dbTrain = false;
                          PrefModel.dbPublicBusMetro = false;
                          PrefModel.dbWalk = false;
                          PrefModel.dbResetCommuteValue = false;
                        });
                        RideShareController().run(PrefModel.dbRideShare);
                        FlightController().run(PrefModel.dbFlight);
                        TrainController().run(PrefModel.dbTrain);
                        PublicBusMetroController()
                            .run(PrefModel.dbPublicBusMetro);
                        WalkController().run(PrefModel.dbWalk);
                        DriveController().run(PrefModel.dbDrive);
                      }
                      // save user Any Commute preferences
                      AnyCommuteController().run(PrefModel.dbAnyCommute);
                      // Shows user "preference saved"
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
                Expanded(
                    child: RaisedButton(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  onPressed: () {
                    context.read<PreferencesModel>().toggleResetCommuteValue();
                    setState(() {
                      PrefModel.dbRideShare = false;
                      PrefModel.dbDrive = false;
                      PrefModel.dbFlight = false;
                      PrefModel.dbTrain = false;
                      PrefModel.dbPublicBusMetro = false;
                      PrefModel.dbWalk = false;
                      PrefModel.dbAnyCommute = false;
                    });
                    RideShareController().run(PrefModel.dbRideShare);
                    FlightController().run(PrefModel.dbFlight);
                    TrainController().run(PrefModel.dbTrain);
                    PublicBusMetroController().run(PrefModel.dbPublicBusMetro);
                    WalkController().run(PrefModel.dbWalk);
                    DriveController().run(PrefModel.dbDrive);

                    AnyCommuteController().run(PrefModel.dbAnyCommute);
                    // Shows user "preference saved"
                    UpdatingSnackbar.showMessage(context);
                  },
                  child: Text('Reset', style: TextStyle(fontSize: 15)),
                ))
              ]),
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
                child:
                    const Text('NEXT (Radius)', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
