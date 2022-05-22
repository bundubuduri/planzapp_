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
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart'
    as Controllers;
import 'package:planzapp/Controllers/Preferences/NoContactPayController.dart';
import 'package:planzapp/Controllers/Preferences/NoContactDeliveryController.dart';
import 'package:planzapp/Controllers/Preferences/StaffMasksController.dart';
import 'package:planzapp/Controllers/Preferences/MasksReqController.dart';
import 'package:planzapp/Controllers/Preferences/StaffGlovesController.dart';
import 'package:planzapp/Controllers/Preferences/LimitCapController.dart';
import 'package:planzapp/Controllers/Preferences/SaniBetwCustController.dart';
import 'package:planzapp/Controllers/Preferences/HandSaniGivenController.dart';
import 'package:planzapp/Controllers/Preferences/AnyHealthCovidController.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:planzapp/Services/Preferences/PrefUpdateService.dart';

import 'package:planzapp/Views/Preferences/PrefDietScreen.dart';
import 'package:planzapp/Views/Preferences/PrefRelatScreen.dart';

class PrefHealthCovidScreen extends StatefulWidget {
  @override
  _PrefHealthCovidScreen createState() => _PrefHealthCovidScreen();
}

class _PrefHealthCovidScreen extends State<PrefHealthCovidScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User? loggedInUser;

  @override
  void initState() {
    super.initState();
    print("Health Covid Preferences page opened");
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
        title: Text('Health, Safety, & Covid Preferences'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                        'planzApp requires this information so we can better match you to experiences within your selected Health, Safety, and Covid-19 parameters'),
                  ),
                  Expanded(
                    // Ask What is the function for.
                    child: IconButton(
                      icon: Icon(Icons.info_rounded),
                      iconSize: 15.0,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Row(children: <Widget>[
                // Contactless Payment Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Contactless Payment',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbNoContactPay,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleNoContactPay();
                      setState(() {
                        PrefModel.dbNoContactPay = newValue;
                      });
                      if (PrefModel.dbNoContactPay == false) {
                        setState(() {
                          PrefModel.dbAnyHealthCovid = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      } else {
                        setState(() {
                          PrefModel.dbResetHealthCovidValue = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      }
                      // save user No Contact Payment preferences
                      NoContactPayController().run(PrefModel.dbNoContactPay!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Contactless Delivery checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Contactless Delivery',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbNoContactDelivery,
                    onChanged: (bool newValue) {
                      context
                          .read<PreferencesModel>()
                          .toggleNoContactDelivery();
                      setState(() {
                        PrefModel.dbNoContactDelivery = newValue;
                      });
                      if (PrefModel.dbNoContactDelivery == false) {
                        setState(() {
                          PrefModel.dbAnyHealthCovid = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      } else {
                        setState(() {
                          PrefModel.dbResetHealthCovidValue = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      }
                      // save user Contactless Delivery preferences
                      NoContactDeliveryController()
                          .run(PrefModel.dbNoContactDelivery!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Staff wear masks Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Staff wear masks',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbStaffMasks,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleStaffMasks();
                      setState(() {
                        PrefModel.dbStaffMasks = newValue;
                      });
                      if (PrefModel.dbStaffMasks == false) {
                        setState(() {
                          PrefModel.dbAnyHealthCovid = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      } else {
                        setState(() {
                          PrefModel.dbResetHealthCovidValue = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      }
                      // save user Staff wear masks preference
                      StaffMasksController().run(PrefModel.dbStaffMasks!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Masks Required checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Masks Required',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbMasksReq,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleMasksReq();
                      setState(() {
                        PrefModel.dbMasksReq = newValue;
                      });
                      if (PrefModel.dbMasksReq == false) {
                        setState(() {
                          PrefModel.dbAnyHealthCovid = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      } else {
                        setState(() {
                          PrefModel.dbResetHealthCovidValue = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      }
                      // save user Masks Required preferences
                      MasksReqController().run(PrefModel.dbMasksReq!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Staff wear gloves check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Staff wear gloves',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbStaffGloves,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleStaffGloves();
                      setState(() {
                        PrefModel.dbStaffGloves = newValue;
                      });
                      if (PrefModel.dbStaffGloves == false) {
                        setState(() {
                          PrefModel.dbAnyHealthCovid = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      } else {
                        setState(() {
                          PrefModel.dbResetHealthCovidValue = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      }
                      // save user Staff wear gloves preference
                      StaffGlovesController().run(PrefModel.dbStaffGloves!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Limited Capacity checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Limited Capacity',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbLimitCap,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleLimitCap();
                      setState(() {
                        PrefModel.dbLimitCap = newValue;
                      });
                      if (PrefModel.dbLimitCap == false) {
                        setState(() {
                          PrefModel.dbAnyHealthCovid = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      } else {
                        setState(() {
                          PrefModel.dbResetHealthCovidValue = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      }
                      // save user Limited Capacity preferences
                      LimitCapController().run(PrefModel.dbLimitCap!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Sanitizing Between Customers Check box
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Sanitizing Between Customers',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbSaniBetwCust,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleSaniBetwCust();
                      setState(() {
                        PrefModel.dbSaniBetwCust = newValue;
                      });
                      if (PrefModel.dbSaniBetwCust == false) {
                        setState(() {
                          PrefModel.dbAnyHealthCovid = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      } else {
                        setState(() {
                          PrefModel.dbResetHealthCovidValue = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      }
                      // save user Sanitizing Between Customers preference
                      SaniBetwCustController().run(PrefModel.dbSaniBetwCust!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),

                // Hand Sanitizer Provided checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Hand Sanitizer Provided',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbHandSaniGiven,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleHandSaniGiven();
                      setState(() {
                        PrefModel.dbHandSaniGiven = newValue;
                      });
                      if (PrefModel.dbHandSaniGiven == false) {
                        setState(() {
                          PrefModel.dbAnyHealthCovid = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      } else {
                        setState(() {
                          PrefModel.dbResetHealthCovidValue = false;
                        });
                        AnyHealthCovidController()
                            .run(PrefModel.dbAnyHealthCovid!);
                      }
                      // save user Hand Sanitizer Provided preferences
                      HandSaniGivenController().run(PrefModel.dbHandSaniGiven!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                // Hand Sanitizer Provided checkbox
                Expanded(
                  child: LabeledCheckbox(
                    label: 'All Health/Covid Precautions',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbAnyHealthCovid,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleAnyHealthCovid();
                      setState(() {
                        PrefModel.dbAnyHealthCovid = newValue;
                      });
                      if (PrefModel.dbAnyHealthCovid == true) {
                        setState(() {
                          PrefModel.dbNoContactPay = newValue;
                          PrefModel.dbNoContactDelivery = newValue;
                          PrefModel.dbStaffMasks = newValue;
                          PrefModel.dbMasksReq = newValue;
                          PrefModel.dbStaffGloves = newValue;
                          PrefModel.dbLimitCap = newValue;
                          PrefModel.dbSaniBetwCust = newValue;
                          PrefModel.dbHandSaniGiven = newValue;
                          PrefModel.dbResetHealthCovidValue = false;
                        });
                        NoContactPayController().run(PrefModel.dbNoContactPay!);
                        NoContactDeliveryController()
                            .run(PrefModel.dbNoContactDelivery!);
                        StaffMasksController().run(PrefModel.dbStaffMasks!);
                        MasksReqController().run(PrefModel.dbMasksReq!);
                        StaffGlovesController().run(PrefModel.dbStaffGloves!);
                        LimitCapController().run(PrefModel.dbLimitCap!);
                        SaniBetwCustController().run(PrefModel.dbSaniBetwCust!);
                        HandSaniGivenController()
                            .run(PrefModel.dbHandSaniGiven!);
                      } else {
                        setState(() {
                          PrefModel.dbNoContactPay = false;
                          PrefModel.dbNoContactDelivery = false;
                          PrefModel.dbStaffMasks = false;
                          PrefModel.dbMasksReq = false;
                          PrefModel.dbStaffGloves = false;
                          PrefModel.dbLimitCap = false;
                          PrefModel.dbSaniBetwCust = false;
                          PrefModel.dbHandSaniGiven = false;
                        });
                        NoContactPayController().run(PrefModel.dbNoContactPay!);
                        NoContactDeliveryController()
                            .run(PrefModel.dbNoContactDelivery!);
                        StaffMasksController().run(PrefModel.dbStaffMasks!);
                        MasksReqController().run(PrefModel.dbMasksReq!);
                        StaffGlovesController().run(PrefModel.dbStaffGloves!);
                        LimitCapController().run(PrefModel.dbLimitCap!);
                        SaniBetwCustController().run(PrefModel.dbSaniBetwCust!);
                        HandSaniGivenController()
                            .run(PrefModel.dbHandSaniGiven!);
                      }
                      // save user Any Health Covid preferences
                      AnyHealthCovidController()
                          .run(PrefModel.dbAnyHealthCovid!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
                // Allege pereference.
                Expanded(
                  child: RaisedButton(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    onPressed: () {
                      context
                          .read<PreferencesModel>()
                          .toggleResetHealthCovidValue();
                      setState(() {
                        PrefModel.dbNoContactPay = false;
                        PrefModel.dbNoContactDelivery = false;
                        PrefModel.dbStaffMasks = false;
                        PrefModel.dbMasksReq = false;
                        PrefModel.dbStaffGloves = false;
                        PrefModel.dbLimitCap = false;
                        PrefModel.dbSaniBetwCust = false;
                        PrefModel.dbHandSaniGiven = false;
                        PrefModel.dbAnyHealthCovid = false;
                      });
                      NoContactPayController().run(PrefModel.dbNoContactPay!);
                      NoContactDeliveryController()
                          .run(PrefModel.dbNoContactDelivery!);
                      StaffMasksController().run(PrefModel.dbStaffMasks!);
                      MasksReqController().run(PrefModel.dbMasksReq!);
                      StaffGlovesController().run(PrefModel.dbStaffGloves!);
                      LimitCapController().run(PrefModel.dbLimitCap!);
                      SaniBetwCustController().run(PrefModel.dbSaniBetwCust!);
                      HandSaniGivenController().run(PrefModel.dbHandSaniGiven!);

                      // save user Any Health Covid preferences
                      AnyHealthCovidController()
                          .run(PrefModel.dbAnyHealthCovid!);
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
                      builder: (BuildContext context) => PrefRelatScreen(),
                    ),
                    (Route route) => false,
                  );
                },
                child: const Text('NEXT (Relationships)',
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
