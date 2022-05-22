import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:planzapp/Models/Preferences/PrefModel.dart';
import 'package:planzapp/Views/Home/MainScreen.dart';
import 'package:planzapp/Views/Preferences/PreferencesScreen.dart';
import 'package:planzapp/Views/Preferences/PrefRelatScreen.dart';
import 'package:planzapp/Views/Preferences/PrefPaymentsScreen.dart';
import 'package:planzapp/Views/Preferences/PrefLocalSpotScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart'
    as Controllers;
import 'package:planzapp/Controllers/Preferences/SpecialsController.dart';
import 'package:planzapp/Controllers/Preferences/OutdoorSeatingController.dart';
import 'package:planzapp/Controllers/Preferences/RooftopController.dart';
import 'package:planzapp/Controllers/Preferences/CoverChargeController.dart';
import 'package:planzapp/Controllers/Preferences/NoCoverChargeController.dart';
import 'package:planzapp/Controllers/Preferences/ParkingController.dart';
import 'package:planzapp/Controllers/Preferences/LiveMusicController.dart';
import 'package:planzapp/Controllers/Preferences/GamesController.dart';
import 'package:planzapp/Controllers/Preferences/CasualController.dart';
import 'package:planzapp/Controllers/Preferences/AccessibilityController.dart';
import 'package:planzapp/Controllers/Preferences/Covid19CompliantController.dart';
import 'package:planzapp/Controllers/Preferences/AnyLocalFeaturesController.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:planzapp/Services/Preferences/PrefUpdateService.dart';

class PrefLocationFeaturesScreen extends StatefulWidget {
  @override
  _PrefLocationFeaturesScreen createState() => _PrefLocationFeaturesScreen();
}

class _PrefLocationFeaturesScreen extends State<PrefLocationFeaturesScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User? loggedInUser;

  @override
  void initState() {
    super.initState();
    print("Location Features Preferences page opened");
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
        // Home button
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
        title: Text('Location Features Preferences'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                        'planzApp requires this information so we can better match you to locations with your preferred features'),
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
              Row(children: <Widget>[
                // Specials Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Specials',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbSpecials,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleSpecials();
                      setState(() {
                        PrefModel.dbSpecials = newValue;
                      });
                      if (PrefModel.dbSpecials == false) {
                        setState(() {
                          PrefModel.dbAnyLocalFeatures = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      } else {
                        setState(() {
                          PrefModel.dbResetLocationFeaturesValue = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      }
                      // save user Specials preference
                      SpecialsController().run(PrefModel.dbSpecials!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Outdoor Seating checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Outdoor Seating',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbOutdoorSeating,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleOutdoorSeating();
                      setState(() {
                        PrefModel.dbOutdoorSeating = newValue;
                      });
                      if (PrefModel.dbOutdoorSeating == false) {
                        setState(() {
                          PrefModel.dbAnyLocalFeatures = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      } else {
                        setState(() {
                          PrefModel.dbResetLocationFeaturesValue = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      }
                      // save user Outdoor Seating preferences
                      OutdoorSeatingController()
                          .run(PrefModel.dbOutdoorSeating!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                //Rooftop Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Rooftop',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbRooftop,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleRooftop();
                      setState(() {
                        PrefModel.dbRooftop = newValue;
                      });
                      if (PrefModel.dbRooftop == false) {
                        setState(() {
                          PrefModel.dbAnyLocalFeatures = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      } else {
                        setState(() {
                          PrefModel.dbResetLocationFeaturesValue = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      }
                      // save user Rooftop preference
                      RooftopController().run(PrefModel.dbRooftop!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Cover Charge Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Cover Charge',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbCoverCharge,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleCoverCharge();
                      setState(() {
                        PrefModel.dbCoverCharge = newValue;
                      });
                      if (PrefModel.dbCoverCharge == false) {
                        setState(() {
                          PrefModel.dbAnyLocalFeatures = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      } else {
                        setState(() {
                          PrefModel.dbResetLocationFeaturesValue = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      }
                      // save user Cover Charge preference
                      CoverChargeController().run(PrefModel.dbCoverCharge!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // No Cover Charge Check box
                // Expanded(
                //   child: LabeledCheckbox(
                //     label: 'No Cover Charge',
                //     padding: const EdgeInsets.symmetric(horizontal: 2.0),
                //     value: PrefModel.dbNoCoverCharge,
                //     onChanged: (bool newValue) {
                //       context.read<PreferencesModel>().toggleNoCoverCharge();
                //       setState(() {
                //         PrefModel.dbNoCoverCharge = newValue;
                //       });
                //       if (PrefModel.dbNoCoverCharge == false) {
                //         setState(() {
                //           PrefModel.dbAnyLocalFeatures = false;
                //         });
                //         AnyLocalFeaturesController()
                //             .run(PrefModel.dbAnyLocalFeatures);
                //       } else {
                //         setState(() {
                //           PrefModel.dbResetLocationFeaturesValue = false;
                //         });
                //         AnyLocalFeaturesController()
                //             .run(PrefModel.dbAnyLocalFeatures);
                //       }
                //       // save user No Cover Charge preference
                //       NoCoverChargeController().run(PrefModel.dbNoCoverCharge);
                //       // Notify user preference saved
                //       UpdatingSnackbar.showMessage(context);
                //     },
                //   ),
                // ),

                // Parking checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Parking',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbParking,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleParking();
                      setState(() {
                        PrefModel.dbParking = newValue;
                      });
                      if (PrefModel.dbParking == false) {
                        setState(() {
                          PrefModel.dbAnyLocalFeatures = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      } else {
                        setState(() {
                          PrefModel.dbResetLocationFeaturesValue = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      }
                      // save user Parking preferences
                      ParkingController().run(PrefModel.dbParking!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Live Music Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Live Music',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbLiveMusic,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleLiveMusic();
                      setState(() {
                        PrefModel.dbLiveMusic = newValue;
                      });
                      if (PrefModel.dbLiveMusic == false) {
                        setState(() {
                          PrefModel.dbAnyLocalFeatures = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      } else {
                        setState(() {
                          PrefModel.dbResetLocationFeaturesValue = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      }
                      // save user Live Music preference
                      LiveMusicController().run(PrefModel.dbLiveMusic!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Games Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Games',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbGames,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleGames();
                      setState(() {
                        PrefModel.dbGames = newValue;
                      });
                      if (PrefModel.dbGames == false) {
                        setState(() {
                          PrefModel.dbAnyLocalFeatures = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      } else {
                        setState(() {
                          PrefModel.dbResetLocationFeaturesValue = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      }
                      // save user Games preference
                      GamesController().run(PrefModel.dbGames!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Casual Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Casual',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbCasual,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleCasual();
                      setState(() {
                        PrefModel.dbCasual = newValue;
                      });
                      if (PrefModel.dbCasual == false) {
                        setState(() {
                          PrefModel.dbAnyLocalFeatures = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      } else {
                        setState(() {
                          PrefModel.dbResetLocationFeaturesValue = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      }
                      // save user Casual preference
                      CasualController().run(PrefModel.dbCasual!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Accessibility checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Accessibility',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbAccessibility,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleAccessibility();
                      setState(() {
                        PrefModel.dbAccessibility = newValue;
                      });
                      if (PrefModel.dbAccessibility == false) {
                        setState(() {
                          PrefModel.dbAnyLocalFeatures = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      } else {
                        setState(() {
                          PrefModel.dbResetLocationFeaturesValue = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      }
                      // save user Accessibility preferences
                      AccessibilityController().run(PrefModel.dbAccessibility!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Covid19 Compliant Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Covid19 Compliant',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbCovid19Compliant,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleCovid19Compliant();
                      setState(() {
                        PrefModel.dbCovid19Compliant = newValue;
                      });
                      if (PrefModel.dbCovid19Compliant = false) {
                        setState(() {
                          PrefModel.dbCovid19Compliant = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      } else {
                        setState(() {
                          PrefModel.dbResetLocationFeaturesValue = false;
                        });
                        AnyLocalFeaturesController()
                            .run(PrefModel.dbAnyLocalFeatures!);
                      }

                      // save user Covid19 Compliant preference
                      Covid19CompliantController()
                          .run(PrefModel.dbCovid19Compliant!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Any Local Features Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'All Features',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbAnyLocalFeatures,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleAnyLocalFeatures();
                      setState(() {
                        PrefModel.dbAnyLocalFeatures = newValue;
                      });
                      if (PrefModel.dbAnyLocalFeatures == true) {
                        setState(() {
                          PrefModel.dbSpecials = newValue;
                          PrefModel.dbOutdoorSeating = newValue;
                          PrefModel.dbRooftop = newValue;
                          PrefModel.dbCoverCharge = newValue;
                          PrefModel.dbNoCoverCharge = newValue;
                          PrefModel.dbParking = newValue;
                          PrefModel.dbLiveMusic = newValue;
                          PrefModel.dbGames = newValue;
                          PrefModel.dbCasual = newValue;
                          PrefModel.dbAccessibility = newValue;
                          PrefModel.dbCovid19Compliant = newValue;
                          PrefModel.dbResetLocationFeaturesValue = false;
                        });
                        SpecialsController().run(PrefModel.dbSpecials!);
                        OutdoorSeatingController()
                            .run(PrefModel.dbOutdoorSeating!);
                        RooftopController().run(PrefModel.dbRooftop!);
                        CoverChargeController().run(PrefModel.dbCoverCharge!);
                        NoCoverChargeController()
                            .run(PrefModel.dbNoCoverCharge!);
                        ParkingController().run(PrefModel.dbParking!);
                        LiveMusicController().run(PrefModel.dbLiveMusic!);
                        GamesController().run(PrefModel.dbGames!);
                        CasualController().run(PrefModel.dbCasual!);
                        AccessibilityController()
                            .run(PrefModel.dbAccessibility!);
                        Covid19CompliantController()
                            .run(PrefModel.dbCovid19Compliant!);
                      } else {
                        setState(() {
                          PrefModel.dbSpecials = false;
                          PrefModel.dbOutdoorSeating = false;
                          PrefModel.dbRooftop = false;
                          PrefModel.dbCoverCharge = false;
                          PrefModel.dbNoCoverCharge = false;
                          PrefModel.dbParking = false;
                          PrefModel.dbLiveMusic = false;
                          PrefModel.dbGames = false;
                          PrefModel.dbCasual = false;
                          PrefModel.dbAccessibility = false;
                          PrefModel.dbCovid19Compliant = false;
                        });
                        SpecialsController().run(PrefModel.dbSpecials!);
                        OutdoorSeatingController()
                            .run(PrefModel.dbOutdoorSeating!);
                        RooftopController().run(PrefModel.dbRooftop!);
                        CoverChargeController().run(PrefModel.dbCoverCharge!);
                        NoCoverChargeController()
                            .run(PrefModel.dbNoCoverCharge!);
                        ParkingController().run(PrefModel.dbParking!);
                        LiveMusicController().run(PrefModel.dbLiveMusic!);
                        GamesController().run(PrefModel.dbGames!);
                        CasualController().run(PrefModel.dbCasual!);
                        AccessibilityController()
                            .run(PrefModel.dbAccessibility!);
                        Covid19CompliantController()
                            .run(PrefModel.dbCovid19Compliant!);
                      }
                      // save user Covid19 Compliant preference
                      AnyLocalFeaturesController()
                          .run(PrefModel.dbAnyLocalFeatures!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                Expanded(
                  child: RaisedButton(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    onPressed: () {
                      context
                          .read<PreferencesModel>()
                          .toggleResetLocationFeaturesValue();
                      setState(() {
                        PrefModel.dbSpecials = false;
                        PrefModel.dbOutdoorSeating = false;
                        PrefModel.dbRooftop = false;
                        PrefModel.dbCoverCharge = false;
                        PrefModel.dbNoCoverCharge = false;
                        PrefModel.dbParking = false;
                        PrefModel.dbLiveMusic = false;
                        PrefModel.dbGames = false;
                        PrefModel.dbCasual = false;
                        PrefModel.dbAccessibility = false;
                        PrefModel.dbCovid19Compliant = false;
                        PrefModel.dbAnyLocalFeatures = false;
                      });
                      SpecialsController().run(PrefModel.dbSpecials!);
                      OutdoorSeatingController()
                          .run(PrefModel.dbOutdoorSeating!);
                      RooftopController().run(PrefModel.dbRooftop!);
                      CoverChargeController().run(PrefModel.dbCoverCharge!);
                      NoCoverChargeController().run(PrefModel.dbNoCoverCharge!);
                      ParkingController().run(PrefModel.dbParking!);
                      LiveMusicController().run(PrefModel.dbLiveMusic!);
                      GamesController().run(PrefModel.dbGames!);
                      CasualController().run(PrefModel.dbCasual!);
                      AccessibilityController().run(PrefModel.dbAccessibility!);
                      Covid19CompliantController()
                          .run(PrefModel.dbCovid19Compliant!);

                      // save user Covid19 Compliant preference
                      AnyLocalFeaturesController()
                          .run(PrefModel.dbAnyLocalFeatures!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                    child: Text('Reset', style: TextStyle(fontSize: 15)),
                  ),
                ),
              ]),
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PrefLocalSpotScreen(),
                    ),
                    (Route route) => false,
                  );
                },
                child: const Text('NEXT (Local Spot)',
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
