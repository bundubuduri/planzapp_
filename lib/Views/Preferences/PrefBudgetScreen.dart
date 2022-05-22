import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:planzapp/util/universalMethods.dart';
import 'package:planzapp/Models/Preferences/PrefModel.dart';
import 'package:planzapp/Views/Home/MainScreen.dart';
import 'package:planzapp/Views/Preferences/PreferencesScreen.dart';
import 'package:planzapp/Views/Preferences/PrefCommuteScreen.dart';
import 'package:planzapp/Views/Preferences/PrefAmbiDensiScreen.dart';
import 'package:planzapp/Views/Preferences/PrefRadiusScreen.dart';
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart'
    as Controllers;
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:planzapp/Controllers/Preferences/BudgetController.dart';
import 'package:planzapp/Controllers/Preferences/AboveBudgetPercentController.dart';
import 'package:planzapp/Controllers/Preferences/BelowBudgetPercentController.dart';
import 'package:planzapp/Controllers/Preferences/NotifyPriceIncController.dart';
import 'package:planzapp/Controllers/Preferences/NotifyPriceDecController.dart';
import 'package:planzapp/Controllers/Preferences/StickToBudgetController.dart';
import 'package:planzapp/Controllers/Preferences/OutOfBudgetController.dart';
import 'package:planzapp/Controllers/Preferences/EnableBelowBudgetController.dart';
import 'package:planzapp/Controllers/Preferences/EnableAboveBudgetController.dart';
import 'package:planzapp/Services/Utility/GetUserService.dart';
import 'package:planzapp/Services/Preferences/PrefUpdateService.dart';

class PrefBudgetScreen extends StatefulWidget {
  @override
  _PrefBudgetScreen createState() => _PrefBudgetScreen();
}

class _PrefBudgetScreen extends State<PrefBudgetScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User? loggedInUser;
  final abovePercentController = TextEditingController();
  final belowPercentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("Budget Preferences Opened");
    getCurrentUser();
  }

  void getCurrentUser() async {
    loggedInUser = await GetUserController().run();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var PrefModel = Provider.of<PreferencesModel>(context);
    String sliderBudget = PrefModel.dbBudget.toString();
    String labelAboveBudgetPercent = PrefModel.dbAboveBudgetPercent.toString();
    String labelBelowBudgetPercent = PrefModel.dbBelowBudgetPercent.toString();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        title: Text('Budget Preferences'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: ListView(
            children: <Widget>[
              Text(
                  'planzApp requires this information so we can better match you to experiences within your selected budget'),
              Text('Budget Range: $sliderBudget', textAlign: TextAlign.center),
              Row(children: <Widget>[
                Expanded(
                  child: Slider(
                    value: PrefModel.dbBudget!,
                    min: 0,
                    max: 100,
                    divisions: 20,
                    label: PrefModel.dbBudget!.round().toString(),
                    onChanged: (double value) {
                      context.read<PreferencesModel>().changeBudget(value);
                      setState(() {
                        PrefModel.dbBudget = value;
                      });
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                    onChangeEnd: (double value) {
                      // save user budget preference
                      BudgetController().run(PrefModel.dbBudget!);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                  child: Text(
                      'Would you like to see plans that are above or below your budget preference?',
                      textAlign: TextAlign.left),
                ),
                IconButton(
                  icon: Icon(Icons.info_rounded),
                  iconSize: 15.0,
                  onPressed: () {},
                ),
                Container(
                  child: Switch(
                    value: PrefModel.dbOutOfBudget!,
                    onChanged: (value) {
                      context.read<PreferencesModel>().toggleOutOfBudget();
                      setState(() {
                        PrefModel.dbOutOfBudget = value;
                        //print(PrefModel.dbOutOfBudget);
                      });
                      OutOfBudgetController().run(PrefModel.dbOutOfBudget!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                  child: Text('Advanced Budget Settings:'),
                ),
              ]),
              // Above budget percent handler
              Row(children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: abovePercentController,
                    decoration: new InputDecoration(
                        labelText: "$labelAboveBudgetPercent Enter an amount"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                  ),
                ),
                Expanded(
                  child: Text('% Above Budget'),
                ),
                Expanded(
                  child: LabeledCheckbox(
                    label: '',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbEnableAboveBudget,
                    onChanged: (bool newValue) {
                      //context.read<PreferencesModel>().toggleAboveBudgetPercent();
                      context
                          .read<PreferencesModel>()
                          .toggleEnableAboveBudget();
                      setState(() {
                        PrefModel.dbEnableAboveBudget = newValue;
                      });
                      // save user above percent preferences
                      if (newValue == true) {
                        EnableAboveBudgetController()
                            .run(PrefModel.dbEnableAboveBudget!);
                        AboveBudgetPercentController()
                            .run(double.parse(abovePercentController.text));
                      } else {
                        EnableAboveBudgetController()
                            .run(PrefModel.dbEnableAboveBudget!);
                      }
                      // Shows user "preference saved"
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              // Below budget percent handler
              Row(children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: belowPercentController,
                    decoration: new InputDecoration(
                        labelText: "$labelBelowBudgetPercent Enter Amount"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                  ),
                ),
                Expanded(
                  child: Text('% Below Budget'),
                ),
                Expanded(
                  child: LabeledCheckbox(
                    label: '',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbEnableBelowBudget,
                    onChanged: (bool newValue) {
                      context
                          .read<PreferencesModel>()
                          .toggleBelowBudgetPercent();
                      setState(() {
                        PrefModel.dbEnableBelowBudget = newValue;
                      });
                      // save user below percent preferences
                      if (newValue == true) {
                        EnableBelowBudgetController()
                            .run(PrefModel.dbEnableBelowBudget!);
                        BelowBudgetPercentController()
                            .run(double.parse(belowPercentController.text));
                      } else {
                        EnableBelowBudgetController()
                            .run(PrefModel.dbEnableBelowBudget!);
                      }

                      // Shows user "preference saved"
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              // Always stick to budget preference handler
              Row(children: <Widget>[
                Expanded(
                  child: LabeledCheckbox(
                    label: 'Always stick to my budget',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbStickToBudget,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleStickToBudget();
                      setState(() {
                        PrefModel.dbStickToBudget = newValue;
                      });
                      // save user public transportation preferences
                      StickToBudgetController().run(PrefModel.dbStickToBudget!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              // Notify plan price decrease handler
              Row(children: <Widget>[
                Expanded(
                  child: LabeledCheckbox(
                    label:
                        'Notify me when there is an increase of price in a plan',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbNotifyPriceInc,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleNotifyPriceInc();
                      setState(() {
                        PrefModel.dbNotifyPriceInc = newValue;
                      });
                      // save user public transportation preferences
                      NotifyPriceIncController()
                          .run(PrefModel.dbNotifyPriceInc!);
                      // Notify user preference saved
                      UpdatingSnackbar.showMessage(context);
                    },
                  ),
                ),
              ]),
              // Notify plan price decrease preference handler
              Row(children: <Widget>[
                Expanded(
                  child: LabeledCheckbox(
                    label:
                        'Notify me when there is a decrease of price in a plan',
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    value: PrefModel.dbNotifyPriceDec,
                    onChanged: (bool newValue) {
                      context.read<PreferencesModel>().toggleNotifyPriceDec();
                      setState(() {
                        PrefModel.dbNotifyPriceDec = newValue;
                      });
                      // save user public transportation preferences
                      NotifyPriceDecController()
                          .run(PrefModel.dbNotifyPriceDec!);
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
                      builder: (BuildContext context) => PrefAmbiDensiScreen(),
                    ),
                    (Route route) => false,
                  );
                },
                child: const Text('NEXT (Ambiance & Density)',
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
