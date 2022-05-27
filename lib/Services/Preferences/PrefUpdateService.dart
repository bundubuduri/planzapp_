
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:search_map_place/search_map_place.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:planzapp/Views/Plans/MapSuggestionsScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';

class PreferenceUpdateService{

  void updateRideShare(bool dbRideShare) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user ride share preferences
    DocumentReference reference = FirebaseFirestore.instance
        .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'RideShare': dbRideShare,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('RideShare', dbRideShare);
  }

  void updateBudget(double dbBudget) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Budget preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Budget': dbBudget,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('Budget', dbBudget);
  }

  void updateAboveBudgetPercent(double dbAboveBudgetPercent) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AboveBudgetPercent preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'AboveBudgetPercent': dbAboveBudgetPercent,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('AboveBudgetPercent', dbAboveBudgetPercent);
  }

  void updateBelowBudgetPercent(double dbBelowBudgetPercent) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user BelowBudgetPercent preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'BelowBudgetPercent': dbBelowBudgetPercent,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('BelowBudgetPercent', dbBelowBudgetPercent);
  }

  void updateNotifyPriceInc(bool dbNotifyPriceIncrease) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user NotifyPriceInc preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'NotifyPriceIncrease': dbNotifyPriceIncrease,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('NotifyPriceIncrease', dbNotifyPriceIncrease);
  }

  void updateNotifyPriceDec(bool dbNotifyPriceDecrease) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user NotifyPriceDec preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'NotifyPriceDecrease': dbNotifyPriceDecrease,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('NotifyPriceDecrease', dbNotifyPriceDecrease);
  }

  void updateStickToBudget(bool dbStickToBudget) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user StickToBudget preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'StickToBudget': dbStickToBudget,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('StickToBudget', dbStickToBudget);
  }

  void updateOutOfBudget(bool dbOutOfBudget) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user OutOfBudget preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'OutOfBudget': dbOutOfBudget,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('OutOfBudget', dbOutOfBudget);
  }

  void updateEnableBelowBudget(bool dbEnableBelowBudget) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user EnableBelowBudget preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'EnableBelowBudget': dbEnableBelowBudget,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('EnableBelowBudget', dbEnableBelowBudget);
  }

  void updateEnableAboveBudget(bool dbEnableAboveBudget) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user EnableAboveBudget preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'EnableAboveBudget': dbEnableAboveBudget,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('EnableAboveBudget', dbEnableAboveBudget);
  }

  void updateMultiplePlans(bool dbMultiplePlans) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user MultiplePlans preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'MultiplePlans': dbMultiplePlans,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('MultiplePlans', dbMultiplePlans);
  }

  void updateDrive(bool dbDrive) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Drive preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Drive': dbDrive,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Drive', dbDrive);
  }

  void updateFlight(bool dbFlight) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Flight preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Flight': dbFlight,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Flight', dbFlight);
  }

  void updateTrain(bool dbTrain) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Train preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Train': dbTrain,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Train', dbTrain);
  }

  void updatePublicBusMetro(bool dbPublicBusMetro) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user PublicBusMetro preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'PublicBusMetro': dbPublicBusMetro,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('PublicBusMetro', dbPublicBusMetro);
  }

  void updateWalk(bool dbWalk) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Walk preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Walk': dbWalk,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Walk', dbWalk);
  }

  void updateAnyCommute(bool dbAnyCommute) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AnyCommute preferences
    DocumentReference reference = FirebaseFirestore.instance
        .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences" );
    reference.update({
      'AnyCommute': dbAnyCommute,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('AnyCommute', dbAnyCommute);
  }

  void updateAfricanCuisine(bool dbAfricanCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AfricanCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'AfricanCuisine': dbAfricanCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('AfricanCuisine', dbAfricanCuisine);
  }

  void updateAmericanCuisine(bool dbAmericanCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AmericanCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'AmericanCuisine': dbAmericanCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('AmericanCuisine', dbAmericanCuisine);
  }

  void updateBarbequeCuisine(bool dbBarbequeCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user BarbequeCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'BarbequeCuisine': dbBarbequeCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('BarbequeCuisine', dbBarbequeCuisine);
  }

  void updateBrazilianCuisine(bool dbBrazilianCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user BrazilianCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'BrazilianCuisine': dbBrazilianCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('BrazilianCuisine', dbBrazilianCuisine);
  }

  void updateCaribbeanCuisine(bool dbCaribbeanCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user CaribbeanCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'CaribbeanCuisine': dbCaribbeanCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('CaribbeanCuisine', dbCaribbeanCuisine);
  }

  void updateChineseCuisine(bool dbChineseCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user ChineseCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'ChineseCuisine': dbChineseCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('ChineseCuisine', dbChineseCuisine);
  }

  void updateFrenchCuisine(bool dbFrenchCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user FrenchCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'FrenchCuisine': dbFrenchCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('FrenchCuisine', dbFrenchCuisine);
  }

  void updateGreekCuisine(bool dbGreekCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user GreekCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'GreekCuisine': dbGreekCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('GreekCuisine', dbGreekCuisine);
  }

  void updateIndianCuisine(bool dbIndianCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user IndianCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'IndianCuisine': dbIndianCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('IndianCuisine', dbIndianCuisine);
  }

  void updateItalianCuisine(bool dbItalianCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user ItalianCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'ItalianCuisine': dbItalianCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('ItalianCuisine', dbItalianCuisine);
  }

  void updateJapaneseCuisine(bool dbJapaneseCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user JapaneseCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'JapaneseCuisine': dbJapaneseCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('JapaneseCuisine', dbJapaneseCuisine);
  }

  void updateMediterraneanCuisine(bool dbMediterraneanCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user MediterraneanCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'MediterraneanCuisine': dbMediterraneanCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('MediterraneanCuisine', dbMediterraneanCuisine);
  }

  void updateMexicanCuisine(bool dbMexicanCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user MexicanCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'MexicanCuisine': dbMexicanCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('MexicanCuisine', dbMexicanCuisine);
  }

  void updateThaiCuisine(bool dbThaiCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user ThaiCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'ThaiCuisine': dbThaiCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('ThaiCuisine', dbThaiCuisine);
  }

  void updateSoulFoodCuisine(bool dbSoulFoodCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user SoulFoodCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'SoulFoodCuisine': dbSoulFoodCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('SoulFoodCuisine', dbSoulFoodCuisine);
  }

  void updateBrunchCuisine(bool dbBrunchCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user BrunchCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'BrunchCuisine': dbBrunchCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('BrunchCuisine', dbBrunchCuisine);
  }

  void updateBuffetCuisine(bool dbBuffetCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user BuffetCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'BuffetCuisine': dbBuffetCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('BuffetCuisine', dbBuffetCuisine);
  }

  void updateDessertsCuisine(bool dbDessertsCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user DessertsCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'DessertsCuisine': dbDessertsCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('DessertsCuisine', dbDessertsCuisine);
  }

  void updateSandwichesCuisine(bool dbSandwichesCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user SandwichesCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'SandwichesCuisine': dbSandwichesCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('SandwichesCuisine', dbSandwichesCuisine);
  }

  void updateNoodlesCuisine(bool dbNoodlesCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user NoodlesCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'NoodlesCuisine': dbNoodlesCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('NoodlesCuisine', dbNoodlesCuisine);
  }

  void updateSeafoodCuisine(bool dbSeafoodCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user SeafoodCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'SeafoodCuisine': dbSeafoodCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('SeafoodCuisine', dbSeafoodCuisine);
  }

  void updateVietnameseCuisine(bool dbVietnameseCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user VietnameseCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'VietnameseCuisine': dbVietnameseCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('VietnameseCuisine', dbVietnameseCuisine);
  }

  void updateTurkishCuisine(bool dbTurkishCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user TurkishCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'TurkishCuisine': dbTurkishCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('TurkishCuisine', dbTurkishCuisine);
  }

  void updateAnyCuisine(bool dbAnyCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AnyCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'AnyCuisine': dbAnyCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('AnyCuisine', dbAnyCuisine);
  }

  void updateNoContactPay(bool dbNoContactPay) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user NoContactPay preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'NoContactPay': dbNoContactPay,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('NoContactPay', dbNoContactPay);
  }

  void updateNoContactDelivery(bool dbNoContactDelivery) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user NoContactDelivery preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'NoContactDelivery': dbNoContactDelivery,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('NoContactDelivery', dbNoContactDelivery);
  }

  void updateStaffMasks(bool dbStaffMasks) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user StaffMasks preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'StaffMasks': dbStaffMasks,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('StaffMasks', dbStaffMasks);
  }

  void updateMasksReq(bool dbMasksReq) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user MasksReq preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'MasksReq': dbMasksReq,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('MasksReq', dbMasksReq);
  }

  void updateStaffGloves(bool dbStaffGloves) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user StaffGloves preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'StaffGloves': dbStaffGloves,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('StaffGloves', dbStaffGloves);
  }

  void updateLimitCap(bool dbLimitCap) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user LimitCap preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'LimitCap': dbLimitCap,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('LimitCap', dbLimitCap);
  }

  void updateSaniBetwCust(bool dbSaniBetwCust) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user SaniBetwCust preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'SaniBetwCust': dbSaniBetwCust,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('SaniBetwCust', dbSaniBetwCust);
  }

  void updateHandSaniGiven(bool dbHandSaniGiven) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user HandSaniGiven preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'HandSaniGiven': dbHandSaniGiven,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('HandSaniGiven', dbHandSaniGiven);
  }

  void updateAnyHealthCovid(bool dbAnyHealthCovid) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AnyHealthCovid preferences
    DocumentReference reference = FirebaseFirestore.instance
        .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
      'AnyHealthCovid': dbAnyHealthCovid,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('AnyHealthCovid', dbAnyHealthCovid);
  }

  void updateDiabeticDiet(bool dbDiabeticDiet) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user DiabeticDiet preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'DiabeticDiet': dbDiabeticDiet,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('DiabeticDiet', dbDiabeticDiet);
  }

  void updateFreshDiet(bool dbFreshDiet) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user FreshDiet preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'FreshDiet': dbFreshDiet,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('FreshDiet', dbFreshDiet);
  }

  void updateHalalDiet(bool dbHalalDiet) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user HalalDiet preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'HalalDiet': dbHalalDiet,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('HalalDiet', dbHalalDiet);
  }

  void updateHealthyNotVegetDiet(bool dbHealthyNotVegetDiet) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user HealthyNotVegetDiet preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'HealthyNotVegetDiet': dbHealthyNotVegetDiet,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('HealthyNotVegetDiet', dbHealthyNotVegetDiet);
  }

  void updateKosherDiet(bool dbKosherDiet) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user KosherDiet preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'KosherDiet': dbKosherDiet,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('KosherDiet', dbKosherDiet);
  }

  void updatePescatarianDiet(bool dbPescatarianDiet) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user PescatarianDiet preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'PescatarianDiet': dbPescatarianDiet,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('PescatarianDiet', dbPescatarianDiet);
  }

  void updateVeganDiet(bool dbVeganDiet) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user VeganDiet preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'VeganDiet': dbVeganDiet,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('VeganDiet', dbVeganDiet);
  }

  void updateVegetarianDiet(bool dbVegetarianDiet) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user VegetarianDiet preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'VegetarianDiet': dbVegetarianDiet,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('VegetarianDiet', dbVegetarianDiet);
  }

  void updateAnyDiet(bool dbAnyDiet) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AnyDiet preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'AnyDiet': dbAnyDiet,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('AnyDiet', dbAnyDiet);
  }

  void updateMatchDiet(bool dbMatchDiet) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user MatchDiet preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'MatchDiet': dbMatchDiet,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('MatchDiet', dbMatchDiet);
  }

  void updateMatchDensity(bool dbMatchDensity) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user MatchDensity preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'MatchDensity': dbMatchDensity,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('MatchDensity', dbMatchDensity);
  }

  void updateMatchCuisine(bool dbMatchCuisine) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user MatchCuisine preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'MatchCuisine': dbMatchCuisine,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('MatchCuisine', dbMatchCuisine);
  }

  void updateGoodForCouples(bool dbGoodForCouples) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user GoodForCouples preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'GoodForCouples': dbGoodForCouples,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('GoodForCouples', dbGoodForCouples);
  }

  void updateMatchPayment(bool dbMatchPayment) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user MatchPayment preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'MatchPayment': dbMatchPayment,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('MatchPayment', dbMatchPayment);
  }

  void updateReqRSVP(bool dbReqRSVP) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user ReqRSVP preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'ReqRSVP': dbReqRSVP,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('ReqRSVP', dbReqRSVP);
  }

  void updateGroups5Plus(bool dbGroups5Plus) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Groups5Plus preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Groups5Plus': dbGroups5Plus,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Groups5Plus', dbGroups5Plus);
  }

  void updateMatchBudget(bool dbMatchBudget) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user MatchBudget preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'MatchBudget': dbMatchBudget,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('MatchBudget', dbMatchBudget);
  }

  void updateWaitTime(double dbWaitTime) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user WaitTime preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'WaitTime': dbWaitTime,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('WaitTime', dbWaitTime);
  }

  void updateLocallyOwned(bool dbLocallyOwned) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user LocallyOwned preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'LocallyOwned': dbLocallyOwned,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('LocallyOwned', dbLocallyOwned);
  }

  void updateLocallySourced(bool dbLocallySourced) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user LocallySourced preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'LocallySourced': dbLocallySourced,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('LocallySourced', dbLocallySourced);
  }

  void updateAnyLocalSpot(bool dbAnyLocalSpot) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AnyLocalSpot preferences
    DocumentReference reference = FirebaseFirestore.instance
        .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
      'AnyLocalSpot': dbAnyLocalSpot,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('AnyLocalSpot', dbAnyLocalSpot);
  }

  void updateSpecials(bool dbSpecials) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Specials preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Specials': dbSpecials,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Specials', dbSpecials);
  }

  void updateOutdoorSeating(bool dbOutdoorSeating) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user OutdoorSeating preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'OutdoorSeating': dbOutdoorSeating,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('OutdoorSeating', dbOutdoorSeating);
  }

  void updateRooftop(bool dbRooftop) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Rooftop preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Rooftop': dbRooftop,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Rooftop', dbRooftop);
  }

  void updateCoverCharge(bool dbCoverCharge) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user CoverCharge preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'CoverCharge': dbCoverCharge,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('CoverCharge', dbCoverCharge);
  }

  void updateNoCoverCharge(bool dbNoCoverCharge) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user NoCoverCharge preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'NoCoverCharge': dbNoCoverCharge,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('NoCoverCharge', dbNoCoverCharge);
  }

  void updateParking(bool dbParking) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Parking preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Parking': dbParking,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Parking', dbParking);
  }

  void updateLiveMusic(bool dbLiveMusic) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user LiveMusic preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'LiveMusic': dbLiveMusic,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('LiveMusic', dbLiveMusic);
  }

  void updateGames(bool dbGames) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Games preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Games': dbGames,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Games', dbGames);
  }

  void updateCasual(bool dbCasual) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Casual preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Casual': dbCasual,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Casual', dbCasual);
  }

  void updateAccessibility(bool dbAccessibility) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Accessibility preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Accessibility': dbAccessibility,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Accessibility', dbAccessibility);
  }

  void updateCovid19Compliant(bool dbCovid19Compliant) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Covid19Compliant preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Covid19Compliant': dbCovid19Compliant,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Covid19Compliant', dbCovid19Compliant);
  }

  void updateAnyLocalFeatures(bool dbAnyLocalFeatures) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AnyLocalFeatures preferences
    DocumentReference reference = FirebaseFirestore.instance
        .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
      'AnyLocalFeatures': dbAnyLocalFeatures,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('AnyLocalFeatures', dbAnyLocalFeatures);
  }

  void updateCash(bool dbCash) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Cash preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Cash': dbCash,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Cash', dbCash);
  }

  void updateCreditDebit(bool dbCreditDebit) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user CreditDebit preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'CreditDebit': dbCreditDebit,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('CreditDebit', dbCreditDebit);
  }

  void updateApplePay(bool dbApplePay) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user ApplePay preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'ApplePay': dbApplePay,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('ApplePay', dbApplePay);
  }

  void updateGooglePay(bool dbGooglePay) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user GooglePay preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'GooglePay': dbGooglePay,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('GooglePay', dbGooglePay);
  }

  void updatePayPal(bool dbPayPal) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user PayPal preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'PayPal': dbPayPal,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('PayPal', dbPayPal);
  }

  void updateCashApp(bool dbCashApp) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user CashApp preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'CashApp': dbCashApp,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('CashApp', dbCashApp);
  }

  void updateVenmo(bool dbVenmo) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Venmo preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Venmo': dbVenmo,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Venmo', dbVenmo);
  }

  void updateCryptocurrency(bool dbCryptocurrency) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Cryptocurrency preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Cryptocurrency': dbCryptocurrency,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Cryptocurrency', dbCryptocurrency);
  }

  void updateAnyPayment(bool dbAnyPayment) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AnyPayment preferences
    DocumentReference reference = FirebaseFirestore.instance
        .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
      'AnyPayment': dbAnyPayment,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('AnyPayment', dbAnyPayment);
  }

  void updateSingle(bool dbSingle) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Single preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Single': dbSingle,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Single', dbSingle);
  }

  void updateMarried(bool dbMarried) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Married preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Married': dbMarried,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Married', dbMarried);
  }

  void updateInARelationship(bool dbInARelationship) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user InARelationship preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'InARelationship': dbInARelationship,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('InARelationship', dbInARelationship);
  }

  void updateAnyRelationship(bool dbAnyRelationship) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AnyRelationship preferences
    DocumentReference reference = FirebaseFirestore.instance
        .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
      'AnyRelationship': dbAnyRelationship,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('AnyRelationship', dbAnyRelationship);
  }

  void updateRadiusDistance(double dbRadiusDistance) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user RadiusDistance preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'RadiusDistance': dbRadiusDistance,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('RadiusDistance', dbRadiusDistance);
  }


  void updateRadiusLocation(Place place) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    final geolocation = await (place.geolocation as FutureOr<Geolocation>);
    // save user RadiusLocationLatLong preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'RadiusLocationLatLong': geolocation.coordinates.toString(),
        'RadiusLocationDescription': place.description,
    });
//SharedPreferences prefs = await SharedPreferences.getInstance();
//prefs.setBool('', db);
  }


  void updateIntimate(bool dbIntimate) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Intimate preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Intimate': dbIntimate,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Intimate', dbIntimate);
  }

  void updateAverageDensity(bool dbAverageDensity) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AverageDensity preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'AverageDensity': dbAverageDensity,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('AverageDensity', dbAverageDensity);
  }

  void updateComfy(bool dbComfy) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user Comfy preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'Comfy': dbComfy,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Comfy', dbComfy);
  }

  void updateAboveAverageDensity(bool dbAboveAverageDensity) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AboveAverageDensity preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'AboveAverageDensity': dbAboveAverageDensity,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('AboveAverageDensity', dbAboveAverageDensity);
  }

  void updatePackedCrowds(bool dbPackedCrowds) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user PackedCrowds preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'PackedCrowds': dbPackedCrowds,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('PackedCrowds', dbPackedCrowds);
  }

  void updateAnyDensity(bool dbAnyDensity) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user AnyDensity preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'AnyDensity': dbAnyDensity,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('AnyDensity', dbAnyDensity);
  }

  void updateSocialDistance(bool dbSocialDistance) async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    // save user SocialDistance preferences
    DocumentReference reference = FirebaseFirestore.instance
    .doc("User/" + loggedInUser.uid.toString() + "/Preferences/Preferences");
    reference.update({
        'SocialDistance': dbSocialDistance,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('SocialDistance', dbSocialDistance);
  }


}
