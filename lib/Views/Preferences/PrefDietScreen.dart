

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
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart' as Controllers;
import 'package:planzapp/Controllers/Preferences/DiabeticDietController.dart';
import 'package:planzapp/Controllers/Preferences/FreshDietController.dart';
import 'package:planzapp/Controllers/Preferences/HalalDietController.dart';
import 'package:planzapp/Controllers/Preferences/HealthyNotVegetDietController.dart';
import 'package:planzapp/Controllers/Preferences/KosherDietController.dart';
import 'package:planzapp/Controllers/Preferences/PescatarianDietController.dart';
import 'package:planzapp/Controllers/Preferences/VeganDietController.dart';
import 'package:planzapp/Controllers/Preferences/VegetarianDietController.dart';
import 'package:planzapp/Controllers/Preferences/AnyDietController.dart';

import 'package:planzapp/Views/Preferences/PrefCommuteScreen.dart';
import 'package:planzapp/Views/Preferences/PrefRadiusScreen.dart';
import 'package:planzapp/Views/Preferences/PrefCuisineScreen.dart';
import 'package:planzapp/Views/Preferences/PrefHealthCovidScreen.dart';

class  PrefDietScreen extends StatefulWidget {
  @override
  _PrefDietScreen createState() => _PrefDietScreen();
}

class _PrefDietScreen extends State<PrefDietScreen> {

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User loggedInUser;

  @override
  void initState() {
    super.initState();
    print("Diet Preferences Page Opened");
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
          title: Text('Diet Preferences'),
        ),
        body: Builder (
          builder: (context) =>
          Center(
          child: ListView (
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('planzApp requires this information so we can better match you to restaurants that serve your preferred diet.'
                    ),
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

              // Diabetic Diet Check box
              Expanded(
                child: LabeledCheckbox(
                  label: 'Diabetic',
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  value: PrefModel.dbDiabeticDiet,
                  onChanged: (bool newValue) {
                    context.read<PreferencesModel>().toggleDiabeticDiet();
                    setState(() {
                      PrefModel.dbDiabeticDiet = newValue;
                    });
                    if (PrefModel.dbDiabeticDiet == false) {
                      setState(() {
                        PrefModel.dbAnyDiet = false;
                      });
                      AnyDietController().run(PrefModel.dbAnyDiet);
                    }
                    else{
                      setState(() {
                        PrefModel.dbResetDietValue = false;
                      });
                      AnyDietController().run(PrefModel.dbAnyDiet);
                    }
                    // save user Diabetic diet preference
                    DiabeticDietController().run(PrefModel.dbDiabeticDiet);
                    // Notify user preference saved
                    UpdatingSnackbar.showMessage(context);
                  },
                ),
              ),

                  // Fresh Diet checkbox
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Fresh',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbFreshDiet,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleFreshDiet();
                        setState(() {
                          PrefModel.dbFreshDiet = newValue;
                        });
                        if (PrefModel.dbFreshDiet == false) {
                          setState(() {
                            PrefModel.dbAnyDiet = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetDietValue = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        // save user Fresh diet preferences
                        FreshDietController().run(PrefModel.dbFreshDiet);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),
                  ]
                ),

                Row (
                children: <Widget>[

                  // Halal Diet Check box
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Halal',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbHalalDiet,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleHalalDiet();
                        setState(() {
                          PrefModel.dbHalalDiet = newValue;
                        });
                        if (PrefModel.dbHalalDiet == false) {
                          setState(() {
                            PrefModel.dbAnyDiet = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetDietValue = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        // save user Halal diet preference
                        HalalDietController().run(PrefModel.dbHalalDiet);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),

                  // Healthy Not Vegetarian Diet checkbox
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Healthy (Not Vegetarian)',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbHealthyNotVegetDiet,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleHealthyNotVegetDiet();
                        setState(() {
                          PrefModel.dbHealthyNotVegetDiet = newValue;
                        });
                        if (PrefModel.dbHealthyNotVegetDiet == false) {
                          setState(() {
                            PrefModel.dbAnyDiet = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetDietValue = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        // save user HealthyNotVeget diet preferences
                        HealthyNotVegetDietController().run(PrefModel.dbHealthyNotVegetDiet);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),
                  ]
                ),

              Row (
                children: <Widget>[

                  // Kosher Diet Check box
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Kosher',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbKosherDiet,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleKosherDiet();
                        setState(() {
                          PrefModel.dbKosherDiet = newValue;
                        });
                        if (PrefModel.dbKosherDiet == false) {
                          setState(() {
                            PrefModel.dbAnyDiet = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetDietValue = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        // save user Kosher diet preference
                        KosherDietController().run(PrefModel.dbKosherDiet);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),

                  // Pescatarian Diet checkbox
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Pescatarian',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbPescatarianDiet,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().togglePescatarianDiet();
                        setState(() {
                          PrefModel.dbPescatarianDiet = newValue;
                        });
                        if (PrefModel.dbPescatarianDiet == false) {
                          setState(() {
                            PrefModel.dbAnyDiet = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetDietValue = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        // save user Pescatarian diet preferences
                        PescatarianDietController().run(PrefModel.dbPescatarianDiet);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),
                  ]
                ),

              Row (
                children: <Widget>[

                  // Vegan Diet Check box
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Vegan',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbVeganDiet,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleVeganDiet();
                        setState(() {
                          PrefModel.dbVeganDiet = newValue;
                        });
                        if (PrefModel.dbVeganDiet == false) {
                          setState(() {
                            PrefModel.dbAnyDiet = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetDietValue = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        // save user Vegan diet preference
                        VeganDietController().run(PrefModel.dbVeganDiet);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),

                  // Vegetarian Diet checkbox
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Vegetarian',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbVegetarianDiet,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleVegetarianDiet();
                        setState(() {
                          PrefModel.dbVegetarianDiet = newValue;
                        });
                        if (PrefModel.dbVegetarianDiet == false) {
                          setState(() {
                            PrefModel.dbAnyDiet = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetDietValue = false;
                          });
                          AnyDietController().run(PrefModel.dbAnyDiet);
                        }
                        // save user Vegetarian diet preferences
                        VegetarianDietController().run(PrefModel.dbVegetarianDiet);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),
                  ]
                ),


              Row (
                children: <Widget>[
                  // Any Diet Check box
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Any',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbAnyDiet,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleAnyDiet();
                        //context.read<PreferencesModel>();
                        setState(() {
                          PrefModel.dbAnyDiet = newValue;
                        });
                        if (PrefModel.dbAnyDiet == true) {
                          setState(() {
                            PrefModel.dbDiabeticDiet = newValue;
                            PrefModel.dbFreshDiet = newValue;
                            PrefModel.dbHalalDiet = newValue;
                            PrefModel.dbHealthyNotVegetDiet = newValue;
                            PrefModel.dbKosherDiet = newValue;
                            PrefModel.dbPescatarianDiet = newValue;
                            PrefModel.dbVeganDiet = newValue;
                            PrefModel.dbVegetarianDiet = true;
                            PrefModel.dbResetDietValue = false;

                            });
                            DiabeticDietController().run(PrefModel.dbDiabeticDiet);
                            FreshDietController().run(PrefModel.dbFreshDiet);
                            HalalDietController().run(PrefModel.dbHalalDiet);
                            HealthyNotVegetDietController().run(PrefModel.dbHealthyNotVegetDiet);
                            KosherDietController().run(PrefModel.dbKosherDiet);
                            PescatarianDietController().run(PrefModel.dbPescatarianDiet);
                            VeganDietController().run(PrefModel.dbVeganDiet);
                            VegetarianDietController().run(PrefModel.dbVegetarianDiet);
                        }
                        else{
                          setState(() {
                            PrefModel.dbDiabeticDiet = false;
                            PrefModel.dbFreshDiet = false;
                            PrefModel.dbHalalDiet = false;
                            PrefModel.dbHealthyNotVegetDiet = false;
                            PrefModel.dbKosherDiet = false;
                            PrefModel.dbPescatarianDiet = false;
                            PrefModel.dbVeganDiet = false;
                            PrefModel.dbVegetarianDiet = false;
                          });
                          DiabeticDietController().run(PrefModel.dbDiabeticDiet);
                          FreshDietController().run(PrefModel.dbFreshDiet);
                          HalalDietController().run(PrefModel.dbHalalDiet);
                          HealthyNotVegetDietController().run(PrefModel.dbHealthyNotVegetDiet);
                          KosherDietController().run(PrefModel.dbKosherDiet);
                          PescatarianDietController().run(PrefModel.dbPescatarianDiet);
                          VeganDietController().run(PrefModel.dbVeganDiet);
                          VegetarianDietController().run(PrefModel.dbVegetarianDiet);
                        }
                        // save user Any diet preference
                        AnyDietController().run(PrefModel.dbAnyDiet);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),

                  Expanded(
                    child: RaisedButton(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      onPressed: () {
                        context.read<PreferencesModel>().toggleResetDIetValue();
                          setState(() {
                            PrefModel.dbDiabeticDiet = false;
                            PrefModel.dbFreshDiet = false;
                            PrefModel.dbHalalDiet = false;
                            PrefModel.dbHealthyNotVegetDiet = false;
                            PrefModel.dbKosherDiet = false;
                            PrefModel.dbPescatarianDiet = false;
                            PrefModel.dbVeganDiet = false;
                            PrefModel.dbVegetarianDiet = false;
                            PrefModel.dbAnyDiet = false;

                          });
                          DiabeticDietController().run(PrefModel.dbDiabeticDiet);
                          FreshDietController().run(PrefModel.dbFreshDiet);
                          HalalDietController().run(PrefModel.dbHalalDiet);
                          HealthyNotVegetDietController().run(PrefModel.dbHealthyNotVegetDiet);
                          KosherDietController().run(PrefModel.dbKosherDiet);
                          PescatarianDietController().run(PrefModel.dbPescatarianDiet);
                          VeganDietController().run(PrefModel.dbVeganDiet);
                          VegetarianDietController().run(PrefModel.dbVegetarianDiet);


                        // save user Any diet preference
                        AnyDietController().run(PrefModel.dbAnyDiet);
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
                      builder: (BuildContext context) => PrefHealthCovidScreen(),
                    ),
                    (Route route) => false,
                );},
                child: const Text('NEXT (Health, Safety, and Covid-19)', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
          ),
        ),
        );
    }
  }
