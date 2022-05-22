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
import 'package:planzapp/Views/Preferences/PrefDietScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart'
    as Controllers;
import 'package:planzapp/Controllers/Preferences/AfricanCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/AmericanCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/BarbequeCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/BrazilianCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/CaribbeanCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/ChineseCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/FrenchCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/GreekCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/IndianCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/ItalianCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/JapaneseCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/MediterraneanCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/MexicanCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/ThaiCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/SoulFoodCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/BrunchCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/BuffetCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/DessertsCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/SandwichesCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/NoodlesCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/SeafoodCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/VietnameseCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/TurkishCuisineController.dart';
import 'package:planzapp/Controllers/Preferences/AnyCuisineController.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:planzapp/Services/Preferences/PrefUpdateService.dart';

class PrefCuisineScreen extends StatefulWidget {
  @override
  _PrefCuisineScreen createState() => _PrefCuisineScreen();
}

class _PrefCuisineScreen extends State<PrefCuisineScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User? loggedInUser;

  @override
  void initState() {
    super.initState();
    print("Cuisine Preferences page opened");
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
        title: Text('Cuisine Preferences'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                        'planzApp requires this information so we can better match you to restaurants that serve your preferred cuisine.'),
                  ),
                ],
              ),
              Row(children: <Widget>[
                // African Cuisine Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'African',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbAfricanCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleAfricanCuisine();
                      setState(() {
                        PrefModel.dbAfricanCuisine = newValue;
                      });
                      if (PrefModel.dbAfricanCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user African cuisine preference
                      AfricanCuisineController()
                          .run(PrefModel.dbAfricanCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // American Cuisine checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'American',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbAmericanCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleAmericanCuisine();
                      setState(() {
                        PrefModel.dbAmericanCuisine = newValue;
                      });
                      if (PrefModel.dbAmericanCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user American cuisine preferences
                      AmericanCuisineController()
                          .run(PrefModel.dbAmericanCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Barbeque Cuisine Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Barbeque',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbBarbequeCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleBarbequeCuisine();
                      setState(() {
                        PrefModel.dbBarbequeCuisine = newValue;
                      });
                      if (PrefModel.dbBarbequeCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Barbeque cuisine preference
                      BarbequeCuisineController()
                          .run(PrefModel.dbBarbequeCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Brazilian Cuisine checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Brazilian',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbBrazilianCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleBrazilianCuisine();
                      setState(() {
                        PrefModel.dbBrazilianCuisine = newValue;
                      });
                      if (PrefModel.dbBrazilianCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Brazilian cuisine preferences
                      BrazilianCuisineController()
                          .run(PrefModel.dbBrazilianCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Caribbean Cuisine Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Caribbean',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbCaribbeanCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleCaribbeanCuisine();
                      setState(() {
                        PrefModel.dbCaribbeanCuisine = newValue;
                      });
                      if (PrefModel.dbCaribbeanCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Caribbean cuisine preference
                      CaribbeanCuisineController()
                          .run(PrefModel.dbCaribbeanCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Chinese Cuisine checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Chinese',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbChineseCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleChineseCuisine();
                      setState(() {
                        PrefModel.dbChineseCuisine = newValue;
                      });
                      if (PrefModel.dbChineseCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Chinese cuisine preferences
                      ChineseCuisineController()
                          .run(PrefModel.dbChineseCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // French Cuisine Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'French',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbFrenchCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleFrenchCuisine();
                      setState(() {
                        PrefModel.dbFrenchCuisine = newValue;
                      });
                      if (PrefModel.dbFrenchCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user French cuisine preference
                      FrenchCuisineController().run(PrefModel.dbFrenchCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Greek Cuisine checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Greek',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbGreekCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleGreekCuisine();
                      setState(() {
                        PrefModel.dbGreekCuisine = newValue;
                      });
                      if (PrefModel.dbGreekCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Greek cuisine preferences
                      GreekCuisineController().run(PrefModel.dbGreekCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Indian Cuisine Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Indian',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbIndianCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleIndianCuisine();
                      setState(() {
                        PrefModel.dbIndianCuisine = newValue;
                      });
                      if (PrefModel.dbIndianCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Indian cuisine preference
                      IndianCuisineController().run(PrefModel.dbIndianCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Italian Cuisine checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Italian',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbItalianCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleItalianCuisine();
                      setState(() {
                        PrefModel.dbItalianCuisine = newValue;
                      });
                      if (PrefModel.dbItalianCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Italian cuisine preferences
                      ItalianCuisineController()
                          .run(PrefModel.dbItalianCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Japanese Cuisine Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Japanese',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbJapaneseCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleJapaneseCuisine();
                      setState(() {
                        PrefModel.dbJapaneseCuisine = newValue;
                      });
                      if (PrefModel.dbJapaneseCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Japanese cuisine preference
                      JapaneseCuisineController()
                          .run(PrefModel.dbJapaneseCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Mediterranean Cuisine checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Mediterranean',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbMediterraneanCuisine,
                    onChanged: (bool newValue) {
                      context
                          .read<PreferencesModel>()
                          .toggleMediterraneanCuisine();
                      setState(() {
                        PrefModel.dbMediterraneanCuisine = newValue;
                      });
                      if (PrefModel.dbMediterraneanCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Mediterranean cuisine preferences
                      MediterraneanCuisineController()
                          .run(PrefModel.dbMediterraneanCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Mexican Cuisine Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Mexican',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbMexicanCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleMexicanCuisine();
                      setState(() {
                        PrefModel.dbMexicanCuisine = newValue;
                      });
                      if (PrefModel.dbMexicanCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Mexican cuisine preference
                      MexicanCuisineController()
                          .run(PrefModel.dbMexicanCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Thai Cuisine checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Thai',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbThaiCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleThaiCuisine();
                      setState(() {
                        PrefModel.dbThaiCuisine = newValue;
                      });
                      if (PrefModel.dbThaiCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Thai cuisine preferences
                      ThaiCuisineController().run(PrefModel.dbThaiCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Soul Food Cuisine Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Soul Food',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbSoulFoodCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleSoulFoodCuisine();
                      setState(() {
                        PrefModel.dbSoulFoodCuisine = newValue;
                      });
                      if (PrefModel.dbSoulFoodCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user SoulFood cuisine preference
                      SoulFoodCuisineController()
                          .run(PrefModel.dbSoulFoodCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Brunch Cuisine checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Brunch',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbBrunchCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleBrunchCuisine();
                      setState(() {
                        PrefModel.dbBrunchCuisine = newValue;
                      });
                      if (PrefModel.dbBrunchCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Brunch cuisine preferences
                      BrunchCuisineController().run(PrefModel.dbBrunchCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Buffet Cuisine Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Buffet',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbBuffetCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleBuffetCuisine();
                      setState(() {
                        PrefModel.dbBuffetCuisine = newValue;
                      });
                      if (PrefModel.dbBuffetCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                      }
                      // save user Buffet cuisine preference
                      BuffetCuisineController().run(PrefModel.dbBuffetCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Desserts Cuisine checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Desserts',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbDessertsCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleDessertsCuisine();
                      setState(() {
                        PrefModel.dbDessertsCuisine = newValue;
                      });
                      if (PrefModel.dbDessertsCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Desserts cuisine preferences
                      DessertsCuisineController()
                          .run(PrefModel.dbDessertsCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Sandwiches Cuisine Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Sandwiches',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbSandwichesCuisine,
                    onChanged: (bool newValue) {
                      context
                          .read<PreferencesModel>()
                          .toggleSandwichesCuisine();
                      setState(() {
                        PrefModel.dbSandwichesCuisine = newValue;
                      });
                      if (PrefModel.dbSandwichesCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save Sandwiches user cuisine preference
                      SandwichesCuisineController()
                          .run(PrefModel.dbSandwichesCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Noodles Cuisine checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Noodles',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbNoodlesCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleNoodlesCuisine();
                      setState(() {
                        PrefModel.dbNoodlesCuisine = newValue;
                      });
                      if (PrefModel.dbNoodlesCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Noodles cuisine preferences
                      NoodlesCuisineController()
                          .run(PrefModel.dbNoodlesCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Seafood Cuisine Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Seafood',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbSeafoodCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleSeafoodCuisine();
                      setState(() {
                        PrefModel.dbSeafoodCuisine = newValue;
                      });
                      if (PrefModel.dbSeafoodCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Seafood cuisine preference
                      SeafoodCuisineController()
                          .run(PrefModel.dbSeafoodCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Vietnamese Cuisine checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Vietnamese',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbVietnameseCuisine,
                    onChanged: (bool newValue) {
                      context
                          .read<PreferencesModel>()
                          .toggleVietnameseCuisine();
                      setState(() {
                        PrefModel.dbVietnameseCuisine = newValue;
                      });
                      if (PrefModel.dbVietnameseCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Vietnamese cuisine preferences
                      VietnameseCuisineController()
                          .run(PrefModel.dbVietnameseCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Turkish Cuisine Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Turkish',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbTurkishCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleTurkishCuisine();
                      setState(() {
                        PrefModel.dbTurkishCuisine = newValue;
                      });
                      if (PrefModel.dbTurkishCuisine == false) {
                        setState(() {
                          PrefModel.dbAnyCuisine = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      }
                      // save user Turkish cuisine preference
                      TurkishCuisineController()
                          .run(PrefModel.dbTurkishCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Any Cuisine Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Any',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbAnyCuisine,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleAnyCuisine();
                      setState(() {
                        PrefModel.dbAnyCuisine = newValue;
                      });
                      if (PrefModel.dbAnyCuisine == true) {
                        setState(() {
                          PrefModel.dbAfricanCuisine = newValue;
                          PrefModel.dbAmericanCuisine = newValue;
                          PrefModel.dbBarbequeCuisine = newValue;
                          PrefModel.dbBrazilianCuisine = newValue;
                          PrefModel.dbCaribbeanCuisine = newValue;
                          PrefModel.dbChineseCuisine = newValue;
                          PrefModel.dbFrenchCuisine = newValue;
                          PrefModel.dbGreekCuisine = newValue;
                          PrefModel.dbIndianCuisine = newValue;
                          PrefModel.dbItalianCuisine = newValue;
                          PrefModel.dbJapaneseCuisine = newValue;
                          PrefModel.dbMediterraneanCuisine = newValue;
                          PrefModel.dbMexicanCuisine = newValue;
                          PrefModel.dbThaiCuisine = newValue;
                          PrefModel.dbTurkishCuisine = newValue;
                          PrefModel.dbSoulFoodCuisine = newValue;
                          PrefModel.dbBrunchCuisine = newValue;
                          PrefModel.dbBuffetCuisine = newValue;
                          PrefModel.dbDessertsCuisine = newValue;
                          PrefModel.dbSandwichesCuisine = newValue;
                          PrefModel.dbNoodlesCuisine = newValue;
                          PrefModel.dbSeafoodCuisine = newValue;
                          PrefModel.dbVietnameseCuisine = newValue;
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AfricanCuisineController()
                            .run(PrefModel.dbAfricanCuisine!);
                        AmericanCuisineController()
                            .run(PrefModel.dbAmericanCuisine!);
                        BarbequeCuisineController()
                            .run(PrefModel.dbBarbequeCuisine!);
                        BrazilianCuisineController()
                            .run(PrefModel.dbBrazilianCuisine!);
                        CaribbeanCuisineController()
                            .run(PrefModel.dbCaribbeanCuisine!);
                        ChineseCuisineController()
                            .run(PrefModel.dbChineseCuisine!);
                        FrenchCuisineController()
                            .run(PrefModel.dbFrenchCuisine!);
                        GreekCuisineController().run(PrefModel.dbGreekCuisine!);
                        IndianCuisineController()
                            .run(PrefModel.dbIndianCuisine!);
                        ItalianCuisineController()
                            .run(PrefModel.dbItalianCuisine!);
                        JapaneseCuisineController()
                            .run(PrefModel.dbJapaneseCuisine!);
                        MediterraneanCuisineController()
                            .run(PrefModel.dbMediterraneanCuisine!);
                        MexicanCuisineController()
                            .run(PrefModel.dbMexicanCuisine!);
                        ThaiCuisineController().run(PrefModel.dbThaiCuisine!);
                        SoulFoodCuisineController()
                            .run(PrefModel.dbSoulFoodCuisine!);
                        BrunchCuisineController()
                            .run(PrefModel.dbBrunchCuisine!);
                        BuffetCuisineController()
                            .run(PrefModel.dbBuffetCuisine!);
                        DessertsCuisineController()
                            .run(PrefModel.dbDessertsCuisine!);
                        SandwichesCuisineController()
                            .run(PrefModel.dbSandwichesCuisine!);
                        NoodlesCuisineController()
                            .run(PrefModel.dbNoodlesCuisine!);
                        SeafoodCuisineController()
                            .run(PrefModel.dbSeafoodCuisine!);
                        VietnameseCuisineController()
                            .run(PrefModel.dbVietnameseCuisine!);
                        TurkishCuisineController()
                            .run(PrefModel.dbTurkishCuisine!);
                      } else {
                        setState(() {
                          PrefModel.dbAfricanCuisine = false;
                          PrefModel.dbAmericanCuisine = false;
                          PrefModel.dbBarbequeCuisine = false;
                          PrefModel.dbBrazilianCuisine = false;
                          PrefModel.dbCaribbeanCuisine = false;
                          PrefModel.dbChineseCuisine = false;
                          PrefModel.dbFrenchCuisine = false;
                          PrefModel.dbGreekCuisine = false;
                          PrefModel.dbIndianCuisine = false;
                          PrefModel.dbItalianCuisine = false;
                          PrefModel.dbJapaneseCuisine = false;
                          PrefModel.dbMediterraneanCuisine = false;
                          PrefModel.dbMexicanCuisine = false;
                          PrefModel.dbThaiCuisine = false;
                          PrefModel.dbTurkishCuisine = false;
                          PrefModel.dbSoulFoodCuisine = false;
                          PrefModel.dbBrunchCuisine = false;
                          PrefModel.dbBuffetCuisine = false;
                          PrefModel.dbDessertsCuisine = false;
                          PrefModel.dbSandwichesCuisine = false;
                          PrefModel.dbNoodlesCuisine = false;
                          PrefModel.dbSeafoodCuisine = false;
                          PrefModel.dbVietnameseCuisine = false;
                          PrefModel.dbResetCuisineValue = false;
                        });
                        AfricanCuisineController()
                            .run(PrefModel.dbAfricanCuisine!);
                        AmericanCuisineController()
                            .run(PrefModel.dbAmericanCuisine!);
                        BarbequeCuisineController()
                            .run(PrefModel.dbBarbequeCuisine!);
                        BrazilianCuisineController()
                            .run(PrefModel.dbBrazilianCuisine!);
                        CaribbeanCuisineController()
                            .run(PrefModel.dbCaribbeanCuisine!);
                        ChineseCuisineController()
                            .run(PrefModel.dbChineseCuisine!);
                        FrenchCuisineController()
                            .run(PrefModel.dbFrenchCuisine!);
                        GreekCuisineController().run(PrefModel.dbGreekCuisine!);
                        IndianCuisineController()
                            .run(PrefModel.dbIndianCuisine!);
                        ItalianCuisineController()
                            .run(PrefModel.dbItalianCuisine!);
                        JapaneseCuisineController()
                            .run(PrefModel.dbJapaneseCuisine!);
                        MediterraneanCuisineController()
                            .run(PrefModel.dbMediterraneanCuisine!);
                        MexicanCuisineController()
                            .run(PrefModel.dbMexicanCuisine!);
                        ThaiCuisineController().run(PrefModel.dbThaiCuisine!);
                        SoulFoodCuisineController()
                            .run(PrefModel.dbSoulFoodCuisine!);
                        BrunchCuisineController()
                            .run(PrefModel.dbBrunchCuisine!);
                        BuffetCuisineController()
                            .run(PrefModel.dbBuffetCuisine!);
                        DessertsCuisineController()
                            .run(PrefModel.dbDessertsCuisine!);
                        SandwichesCuisineController()
                            .run(PrefModel.dbSandwichesCuisine!);
                        NoodlesCuisineController()
                            .run(PrefModel.dbNoodlesCuisine!);
                        SeafoodCuisineController()
                            .run(PrefModel.dbSeafoodCuisine!);
                        VietnameseCuisineController()
                            .run(PrefModel.dbVietnameseCuisine!);
                        TurkishCuisineController()
                            .run(PrefModel.dbTurkishCuisine!);
                      }
                      // save user Any cuisine preference
                      AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                Expanded(
                    child: RaisedButton(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  onPressed: () {
                    context.read<PreferencesModel>().toggleResetCuisineValue();
                    setState(() {
                      PrefModel.dbAfricanCuisine = false;
                      PrefModel.dbAmericanCuisine = false;
                      PrefModel.dbBarbequeCuisine = false;
                      PrefModel.dbBrazilianCuisine = false;
                      PrefModel.dbCaribbeanCuisine = false;
                      PrefModel.dbChineseCuisine = false;
                      PrefModel.dbFrenchCuisine = false;
                      PrefModel.dbGreekCuisine = false;
                      PrefModel.dbIndianCuisine = false;
                      PrefModel.dbItalianCuisine = false;
                      PrefModel.dbJapaneseCuisine = false;
                      PrefModel.dbMediterraneanCuisine = false;
                      PrefModel.dbMexicanCuisine = false;
                      PrefModel.dbThaiCuisine = false;
                      PrefModel.dbTurkishCuisine = false;
                      PrefModel.dbSoulFoodCuisine = false;
                      PrefModel.dbBrunchCuisine = false;
                      PrefModel.dbBuffetCuisine = false;
                      PrefModel.dbDessertsCuisine = false;
                      PrefModel.dbSandwichesCuisine = false;
                      PrefModel.dbNoodlesCuisine = false;
                      PrefModel.dbSeafoodCuisine = false;
                      PrefModel.dbVietnameseCuisine = false;
                      PrefModel.dbAnyCuisine = false;
                    });
                    AfricanCuisineController().run(PrefModel.dbAfricanCuisine!);
                    AmericanCuisineController()
                        .run(PrefModel.dbAmericanCuisine!);
                    BarbequeCuisineController()
                        .run(PrefModel.dbBarbequeCuisine!);
                    BrazilianCuisineController()
                        .run(PrefModel.dbBrazilianCuisine!);
                    CaribbeanCuisineController()
                        .run(PrefModel.dbCaribbeanCuisine!);
                    ChineseCuisineController().run(PrefModel.dbChineseCuisine!);
                    FrenchCuisineController().run(PrefModel.dbFrenchCuisine!);
                    GreekCuisineController().run(PrefModel.dbGreekCuisine!);
                    IndianCuisineController().run(PrefModel.dbIndianCuisine!);
                    ItalianCuisineController().run(PrefModel.dbItalianCuisine!);
                    JapaneseCuisineController()
                        .run(PrefModel.dbJapaneseCuisine!);
                    MediterraneanCuisineController()
                        .run(PrefModel.dbMediterraneanCuisine!);
                    MexicanCuisineController().run(PrefModel.dbMexicanCuisine!);
                    ThaiCuisineController().run(PrefModel.dbThaiCuisine!);
                    SoulFoodCuisineController()
                        .run(PrefModel.dbSoulFoodCuisine!);
                    BrunchCuisineController().run(PrefModel.dbBrunchCuisine!);
                    BuffetCuisineController().run(PrefModel.dbBuffetCuisine!);
                    DessertsCuisineController()
                        .run(PrefModel.dbDessertsCuisine!);
                    SandwichesCuisineController()
                        .run(PrefModel.dbSandwichesCuisine!);
                    NoodlesCuisineController().run(PrefModel.dbNoodlesCuisine!);
                    SeafoodCuisineController().run(PrefModel.dbSeafoodCuisine!);
                    VietnameseCuisineController()
                        .run(PrefModel.dbVietnameseCuisine!);
                    TurkishCuisineController().run(PrefModel.dbTurkishCuisine!);

                    // save user Any cuisine preference
                    AnyCuisineController().run(PrefModel.dbAnyCuisine!);
                    // Notify user preference saved
                    UpdatingSnackbar.showMessage(context);
                  },
                  child: Text('Reset', style: TextStyle(fontSize: 15)),
                )),
              ]),
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
                child:
                    const Text('NEXT (Diet)', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
      // Refeash butten.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //go down button function
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
