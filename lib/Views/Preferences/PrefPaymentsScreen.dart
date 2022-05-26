

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
import 'package:planzapp/Views/Preferences/PrefLocalSpotScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart' as Controllers;
import 'package:planzapp/Controllers/Preferences/CashController.dart';
import 'package:planzapp/Controllers/Preferences/CreditDebitController.dart';
import 'package:planzapp/Controllers/Preferences/ApplePayController.dart';
import 'package:planzapp/Controllers/Preferences/GooglePayController.dart';
import 'package:planzapp/Controllers/Preferences/PayPalController.dart';
import 'package:planzapp/Controllers/Preferences/CashAppController.dart';
import 'package:planzapp/Controllers/Preferences/VenmoController.dart';
import 'package:planzapp/Controllers/Preferences/CryptocurrencyController.dart';
import 'package:planzapp/Controllers/Preferences/AnyPaymentController.dart';



class PrefPaymentsScreen extends StatefulWidget {
  @override
  _PrefPaymentsScreen createState() => _PrefPaymentsScreen();
}

class _PrefPaymentsScreen extends State<PrefPaymentsScreen> {

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static User? loggedInUser;

  @override
  void initState() {
    super.initState();
    print("Payments Preference Screen Opened");
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
          title: Text('Payment Preferences'),
        ),
          body: Builder (
            builder: (context) =>
            Center(
          child: ListView (
            children: <Widget>[

              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('planzApp requires this information so we can better match you to locations with your preferred payment options.'),
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
                  
                  // Cash Check box
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Cash',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbCash,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleCash();
                        setState(() {
                            PrefModel.dbCash = newValue;
                        });
                        if (PrefModel.dbCash == false){
                          setState(() {
                              PrefModel.dbAnyPayment = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetPaymentsValue = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        // save user Cash preference
                        CashController().run(PrefModel.dbCash!);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),

                  // Credit/Debit checkbox
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Credit/Debit',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbCreditDebit,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleCreditDebit();
                        setState(() {
                            PrefModel.dbCreditDebit = newValue;
                        });
                        if (PrefModel.dbCreditDebit == false){
                          setState(() {
                              PrefModel.dbAnyPayment = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetPaymentsValue = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        // save user Credit/Debit preferences
                        CreditDebitController().run(PrefModel.dbCreditDebit!);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),
                  ]
                ),

                Row (
                  children: <Widget>[

                    //Apple Pay Check box
                    Expanded(
                    child: LabeledCheckbox(
                      label: 'Apple Pay',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbApplePay,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleApplePay();
                        setState(() {
                            PrefModel.dbApplePay = newValue;
                        });
                        if (PrefModel.dbApplePay == false){
                          setState(() {
                              PrefModel.dbAnyPayment = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetPaymentsValue = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        // save user Apple Pay preference
                        ApplePayController().run(PrefModel.dbApplePay!);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),

                  // Google Pay Check box
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Google Pay',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbGooglePay,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleGooglePay();
                        setState(() {
                            PrefModel.dbGooglePay = newValue;
                        });
                        if (PrefModel.dbGooglePay == false){
                          setState(() {
                              PrefModel.dbAnyPayment = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetPaymentsValue = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        // save user Google Pay preference
                        GooglePayController().run(PrefModel.dbGooglePay!);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),
                  ]
                ),


              Row (
                children: <Widget>[
                  
                  // PayPal Check box
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'PayPal',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbPayPal,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().togglePayPal();
                        setState(() {
                            PrefModel.dbPayPal = newValue;
                        });
                        if (PrefModel.dbPayPal == false){
                          setState(() {
                              PrefModel.dbAnyPayment = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetPaymentsValue = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        // save user PayPal preference
                        PayPalController().run(PrefModel.dbPayPal!);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),

                  // CashApp checkbox
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'CashApp',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbCashApp,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleCashApp();
                        setState(() {
                            PrefModel.dbCashApp = newValue;
                        });
                        if (PrefModel.dbCashApp == false){
                          setState(() {
                              PrefModel.dbAnyPayment = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetPaymentsValue = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        // save user CashApp preferences
                        CashAppController().run(PrefModel.dbCashApp!);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),
                  ]
                ),

                Row (
                  children: <Widget>[

                    // Venmo Check box
                    Expanded(
                    child: LabeledCheckbox(
                      label: 'Venmo',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbVenmo,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleVenmo();
                        setState(() {
                            PrefModel.dbVenmo = newValue;
                        });
                        if (PrefModel.dbVenmo == false){
                          setState(() {
                              PrefModel.dbAnyPayment = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetPaymentsValue = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        // save user Venmo preference
                        VenmoController().run(PrefModel.dbVenmo!);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),

                  // Cryptocurrency Check box
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Cryptocurrency',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbCryptocurrency,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleCryptocurrency();
                        setState(() {
                            PrefModel.dbCryptocurrency = newValue;
                        });
                        if (PrefModel.dbCryptocurrency == false){
                          setState(() {
                              PrefModel.dbAnyPayment = newValue;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        else{
                          setState(() {
                            PrefModel.dbResetPaymentsValue = false;
                          });
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        }
                        // save user Cryptocurrency preference
                        CryptocurrencyController().run(PrefModel.dbCryptocurrency!);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),
                  ]
                ),

                Row (
                  children: <Widget>[

                    // AnyPayment Check box
                    Expanded(
                    child: LabeledCheckbox(
                      label: 'AnyPayment',
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      value: PrefModel.dbAnyPayment,
                      onChanged: (bool newValue) {
                        context.read<PreferencesModel>().toggleAnyPayment();
                        setState(() {
                            PrefModel.dbAnyPayment = newValue;
                        });
                        if (PrefModel.dbAnyPayment == true){
                          setState(() {
                              PrefModel.dbCash = newValue;
                              PrefModel.dbCreditDebit = newValue;
                              PrefModel.dbApplePay = newValue;
                              PrefModel.dbGooglePay = newValue;
                              PrefModel.dbPayPal = newValue;
                              PrefModel.dbCashApp = newValue;
                              PrefModel.dbVenmo = newValue;
                              PrefModel.dbCryptocurrency = newValue;

                          });
                          CashController().run(PrefModel.dbCash!);
                          CreditDebitController().run(PrefModel.dbCreditDebit!);
                          ApplePayController().run(PrefModel.dbApplePay!);
                          GooglePayController().run(PrefModel.dbGooglePay!);
                          PayPalController().run(PrefModel.dbPayPal!);
                          CashAppController().run(PrefModel.dbCashApp!);
                          VenmoController().run(PrefModel.dbVenmo!);
                          CryptocurrencyController().run(PrefModel.dbCryptocurrency!);
                        }
                        else{
                          setState(() {
                            PrefModel.dbCash = false;
                            PrefModel.dbCreditDebit = false;
                            PrefModel.dbApplePay = false;
                            PrefModel.dbGooglePay = false;
                            PrefModel.dbPayPal = false;
                            PrefModel.dbCashApp = false;
                            PrefModel.dbVenmo = false;
                            PrefModel.dbCryptocurrency = false;

                          });
                          CashController().run(PrefModel.dbCash!);
                          CreditDebitController().run(PrefModel.dbCreditDebit!);
                          ApplePayController().run(PrefModel.dbApplePay!);
                          GooglePayController().run(PrefModel.dbGooglePay!);
                          PayPalController().run(PrefModel.dbPayPal!);
                          CashAppController().run(PrefModel.dbCashApp!);
                          VenmoController().run(PrefModel.dbVenmo!);
                          CryptocurrencyController().run(PrefModel.dbCryptocurrency!);
                        }
                        // save user AnyPayment preference
                        AnyPaymentController().run(PrefModel.dbAnyPayment!);
                        // Notify user preference saved
                        UpdatingSnackbar.showMessage(context);
                      },
                    ),
                  ),

                    Expanded(
                      child: RaisedButton(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        onPressed: () {
                          context.read<PreferencesModel>().toggleResetPaymentValue();
                            setState(() {
                              PrefModel.dbCash = false;
                              PrefModel.dbCreditDebit = false;
                              PrefModel.dbApplePay = false;
                              PrefModel.dbGooglePay = false;
                              PrefModel.dbPayPal = false;
                              PrefModel.dbCashApp = false;
                              PrefModel.dbVenmo = false;
                              PrefModel.dbCryptocurrency = false;
                              PrefModel.dbAnyPayment = false;
                            });
                            CashController().run(PrefModel.dbCash!);
                            CreditDebitController().run(PrefModel.dbCreditDebit!);
                            ApplePayController().run(PrefModel.dbApplePay!);
                            GooglePayController().run(PrefModel.dbGooglePay!);
                            PayPalController().run(PrefModel.dbPayPal!);
                            CashAppController().run(PrefModel.dbCashApp!);
                            VenmoController().run(PrefModel.dbVenmo!);
                            CryptocurrencyController().run(PrefModel.dbCryptocurrency!);

                          // save user AnyPayment preference
                          AnyPaymentController().run(PrefModel.dbAnyPayment!);
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
                      builder: (BuildContext context) => MainScreen(),
                    ),
                    (Route route) => false,
                );},
                child: const Text('Complete Preferences Setup', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
      );
    }
  }
