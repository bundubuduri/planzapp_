
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planzapp/Views/Plans/MapSuggestionsScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';

class GetPreferencesService{

  //Future<User> loggedInUser = GetUserController().run();
  Future<void> getPreferences() async {
    User loggedInUser = await (GetUserController().run() as FutureOr<User>);
    final _firestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    // db is short for database
    // budget values
    double? dbBudget = 0.0;
    double? dbAboveBudgetPercent = 0.0;
    double? dbBelowBudgetPercent = 0.0;
    bool? dbNotifyPriceInc = false;
    bool? dbNotifyPriceDec = false;
    bool? dbStickToBudget = false;
    bool? dbOutOfBudget = false;
    bool? dbEnableBelowBudget = false;
    bool? dbEnableAboveBudget = false;
    String budgetPreferences = '';

    // multiple itineraries values
    bool? dbMultiplePlans = false;
    String MultiplePlansPreferences = '';

    // commute values
    bool? dbRideShare = false;
    bool? dbDrive = false;
    bool? dbFlight = false;
    bool? dbTrain = false;
    bool? dbPublicBusMetro = false;
    bool? dbWalk = false;
    bool? dbAnyCommute = false;
    String commutePreferences = '';

    // cuisine values
    bool? dbAfricanCuisine = false;
    bool? dbAmericanCuisine = false;
    bool? dbBarbequeCuisine = false;
    bool? dbBrazilianCuisine = false;
    bool? dbCaribbeanCuisine = false;
    bool? dbChineseCuisine = false;
    bool? dbFrenchCuisine = false;
    bool? dbGreekCuisine = false;
    bool? dbIndianCuisine = false;
    bool? dbItalianCuisine = false;
    bool? dbJapaneseCuisine = false;
    bool? dbMediterraneanCuisine = false;
    bool? dbMexicanCuisine = false;
    bool? dbThaiCuisine = false;
    bool? dbSoulFoodCuisine = false;
    bool? dbBrunchCuisine = false;
    bool? dbBuffetCuisine = false;
    bool? dbDessertsCuisine = false;
    bool? dbSandwichesCuisine = false;
    bool? dbNoodlesCuisine = false;
    bool? dbSeafoodCuisine = false;
    bool? dbVietnameseCuisine = false;
    bool? dbTurkishCuisine = false;
    bool? dbAnyCuisine = false;
    String cuisinePreferences = '';

    // health and covid values
    bool? dbNoContactPay = false;
    bool? dbNoContactDelivery = false;
    bool? dbStaffMasks = false;
    bool? dbMasksReq = false;
    bool? dbStaffGloves = false;
    bool? dbLimitCap = false;
    bool? dbSaniBetwCust = false;
    bool? dbHandSaniGiven = false;
    bool? dbAnyHealthCovid = false;
    String healthCovidPreferences = '';

    // diet values
    bool? dbDiabeticDiet = false;
    bool? dbFreshDiet = false;
    bool? dbHalalDiet = false;
    bool? dbHealthyNotVegetDiet = false;
    bool? dbKosherDiet = false;
    bool? dbPescatarianDiet = false;
    bool? dbVeganDiet = false;
    bool? dbVegetarianDiet = false;
    bool? dbAnyDiet = false;
    String dietPreferences = '';

    // general values
    bool? dbMatchDiet = false;
    bool? dbMatchDensity = false;
    bool? dbMatchCuisine = false;
    bool? dbGoodForCouples = false;
    bool? dbMatchPayment = false;
    bool? dbReqRSVP = false;
    bool? dbGroups5Plus = false;
    bool? dbMatchBudget = false;
    double? dbWaitTime = 0.0;
    String generalFeaturesPreferences = '';

    // local spot values
    bool? dbLocallyOwned = false;
    bool? dbLocallySourced = false;
    bool? dbAnyLocalSpot = false;
    String localSpotPreferences = '';

    // location features values
    bool? dbSpecials = false;
    bool? dbOutdoorSeating = false;
    bool? dbRooftop = false;
    bool? dbCoverCharge = false;
    bool? dbNoCoverCharge = false;
    bool? dbParking = false;
    bool? dbLiveMusic = false;
    bool? dbGames = false;
    bool? dbCasual = false;
    bool? dbAccessibility = false;
    bool? dbCovid19Compliant = false;
    bool? dbAnyLocalFeatures = false;
    String locationFeaturesPreferences = '';

    // payment values
    bool? dbCash = false;
    bool? dbCreditDebit = false;
    bool? dbApplePay = false;
    bool? dbGooglePay = false;
    bool? dbPayPal = false;
    bool? dbCashApp = false;
    bool? dbVenmo = false;
    bool? dbAnyPayment = false;
    String paymentPreferences = '';

    // relationship values
    bool? dbCryptocurrency = false;
    bool? dbSingle = false;
    bool? dbMarried = false;
    bool? dbInARelationship = false;
    bool? dbAnyRelationship = false;
    String relationshipPreferences = '';

    // radius values
    double? dbRadiusDistance = 0.0;
    Place? dbRadiusLocationDescription;
    String radiusPreferences = '';


    // ambience and density values
    bool? dbIntimate = false;
    bool? dbAverageDensity = false;
    bool? dbComfy = false;
    bool? dbAboveAverageDensity = false;
    bool? dbPackedCrowds = false;
    bool? dbAnyDensity = false;
    bool? dbSocialDistance = false;
    bool dbAnyAmbianceDensity = false;
    String ambianceDensityPreferences = '';

    try {
      Stream reference = FirebaseFirestore.instance
          .collection('User')
          .doc(loggedInUser.uid.toString())
          .collection('Preferences')
          .doc('Preferences')
          .snapshots();
      reference.listen((value) {
        // Get budget info
        dbBudget = value.data()['Budget'];
        dbNotifyPriceInc = value.data()['NotifyPriceIncrease'];
        dbNotifyPriceDec = value.data()['NotifyPriceDecrease'];
        dbStickToBudget = value.data()['StickToBudget'];
        dbOutOfBudget = value.data()['OutOfBudget'];
        dbEnableBelowBudget = value.data()['BudgetBelowEnabled'];
        dbEnableAboveBudget = value.data()['BudgetAboveEnabled'];
        dbAboveBudgetPercent = value.data()['BudgetAbove'];
        dbBelowBudgetPercent = value.data()['BudgetBelow'];
        budgetPreferences = '';
        if (dbBudget != null) {
          budgetPreferences += '\$$dbBudget ';
        }
        if (dbAboveBudgetPercent != null && dbEnableAboveBudget == true) {
          budgetPreferences += '(+ $dbAboveBudgetPercent%) ' ;
        }
        if (dbBelowBudgetPercent != null && dbEnableBelowBudget == true) {
          budgetPreferences += '(- $dbBelowBudgetPercent%) ' ;
        }
        if (dbStickToBudget == true) {
          budgetPreferences += 'Stick to my budget, ';
        }
        if (dbOutOfBudget == true) {
          budgetPreferences += 'View plans outside of budget, ';
        }
        if (dbNotifyPriceInc == true) {
          budgetPreferences += 'Notify me of price increases in plans, ';
        }
        if (dbNotifyPriceDec == true) {
          budgetPreferences += 'Notify me of price decreases in plans ';
        }
        // Get Multiple Plans info 
        dbMultiplePlans = value.data()['MultiplePlans'];
        MultiplePlansPreferences = '';
        if (dbMultiplePlans == true) {
          MultiplePlansPreferences += 'Allowed';
        }
        if (dbMultiplePlans == false) {
          MultiplePlansPreferences += 'Not Allowed';
        }
        // Get commute info
        dbRideShare = value.data()['RideShare'];
        dbDrive = value.data()['Drive'];
        dbFlight = value.data()['Flight'];
        dbTrain = value.data()['Train'];
        dbPublicBusMetro = value.data()['PublicBusMetro'];
        dbWalk = value.data()['Walk'];
        dbAnyCommute = value.data()['AnyCommute'];
        commutePreferences = '';
        if (dbRideShare == true) {
          commutePreferences += '';
        }
        if (dbDrive == true) {
          commutePreferences += 'Drive, ';
        }
        if (dbFlight == true) {
          commutePreferences += 'Flight, ';
        }
        if (dbTrain == true) {
          commutePreferences += 'Train, ';
        }
        if (dbPublicBusMetro == true) {
          commutePreferences += 'Public Bus/Metro, ';
        }
        if (dbWalk == true) {
          commutePreferences += 'Walk, ';
        }
        if (dbAnyCommute == true) {
          commutePreferences = 'All';
        }
        // Get cuisine info
        dbAfricanCuisine = value.data()['AfricanCuisine'];
        dbAmericanCuisine = value.data()['AmericanCuisine'];
        dbBarbequeCuisine = value.data()['BarbequeCuisine'];
        dbBrazilianCuisine = value.data()['BrazilianCuisine'];
        dbCaribbeanCuisine = value.data()['CaribbeanCuisine'];
        dbChineseCuisine = value.data()['ChineseCuisine'];
        dbFrenchCuisine = value.data()['FrenchCuisine'];
        dbGreekCuisine = value.data()['GreekCuisine'];
        dbIndianCuisine = value.data()['IndianCuisine'];
        dbItalianCuisine = value.data()['ItalianCuisine'];
        dbJapaneseCuisine = value.data()['JapaneseCuisine'];
        dbMediterraneanCuisine = value.data()['MediterraneanCuisine'];
        dbMexicanCuisine = value.data()['MexicanCuisine'];
        dbThaiCuisine = value.data()['ThaiCuisine'];
        dbSoulFoodCuisine = value.data()['SoulFoodCuisine'];
        dbBrunchCuisine = value.data()['BrunchCuisine'];
        dbBuffetCuisine = value.data()['BuffetCuisine'];
        dbDessertsCuisine = value.data()['DessertsCuisine'];
        dbSandwichesCuisine = value.data()['SandwichesCuisine'];
        dbNoodlesCuisine = value.data()['NoodlesCuisine'];
        dbSeafoodCuisine = value.data()['SeafoodCuisine'];
        dbVietnameseCuisine = value.data()['VietnameseCuisine'];
        dbTurkishCuisine = value.data()['TurkishCuisine'];
        dbAnyCuisine = value.data()['AnyCuisine'];
        cuisinePreferences = '';
        if (dbAfricanCuisine == true) {
          cuisinePreferences += 'African, ';
        }
        if (dbAmericanCuisine == true) {
          cuisinePreferences += 'American, ';
        }
        if (dbBarbequeCuisine == true) {
          cuisinePreferences += 'Barbeque, ';
        }
        if (dbBrazilianCuisine == true) {
          cuisinePreferences += 'Brazilian, ';
        }
        if (dbCaribbeanCuisine == true) {
          cuisinePreferences += 'Caribbean, ';
        }
        if (dbChineseCuisine == true) {
          cuisinePreferences += 'Chinese, ';
        }
        if (dbFrenchCuisine == true) {
          cuisinePreferences += 'French, ';
        }
        if (dbGreekCuisine == true) {
          cuisinePreferences += 'Greek, ';
        }
        if (dbIndianCuisine == true) {
          cuisinePreferences += 'Indian, ';
        }
        if (dbItalianCuisine == true) {
          cuisinePreferences += 'Italian, ';
        }
        if (dbJapaneseCuisine == true) {
          cuisinePreferences += 'Japanese, ';
        }
        if (dbMediterraneanCuisine == true) {
          cuisinePreferences += 'Mediterranean, ';
        }
        if (dbMexicanCuisine == true) {
          cuisinePreferences += 'Mexican, ';
        }
        if (dbThaiCuisine == true) {
          cuisinePreferences += 'Thai, ';
        }
        if (dbSoulFoodCuisine == true) {
          cuisinePreferences += 'Soul Food, ';
        }
        if (dbBrunchCuisine == true) {
          cuisinePreferences += 'Brunch, ';
        }
        if (dbBuffetCuisine == true) {
          cuisinePreferences += 'Buffet, ';
        }
        if (dbDessertsCuisine == true) {
          cuisinePreferences += 'Desserts, ';
        }
        if (dbSandwichesCuisine == true) {
          cuisinePreferences += 'Sandwiches, ';
        }
        if (dbNoodlesCuisine == true) {
          cuisinePreferences += 'Noodles, ';
        }
        if (dbSeafoodCuisine == true) {
          cuisinePreferences += 'Seafood, ';
        }
        if (dbVietnameseCuisine == true) {
          cuisinePreferences += 'Vietnamese, ';
        }
        if (dbTurkishCuisine == true) {
          cuisinePreferences += 'Turkish ';
        }
        if (dbAnyCuisine == true) {
          cuisinePreferences = 'All';
        }
        // get health and covid values
        dbNoContactPay = value.data()['NoContactPay'];
        dbNoContactDelivery = value.data()['NoContactDelivery'];
        dbStaffMasks = value.data()['StaffMasks'];
        dbMasksReq = value.data()['MasksReq'];
        dbStaffGloves = value.data()['StaffGloves'];
        dbLimitCap = value.data()['LimitCap'];
        dbSaniBetwCust = value.data()['SaniBetwCust'];
        dbHandSaniGiven = value.data()['HandSaniGiven'];
        dbAnyHealthCovid = value.data()['AnyHealthCovid'];
        healthCovidPreferences = '';
        if (dbNoContactPay == true) {
          healthCovidPreferences += 'No Contact Payment, ';
        }
        if (dbNoContactDelivery == true) {
          healthCovidPreferences += 'No Contact Delivery, ';
        }
        if (dbStaffMasks == true) {
          healthCovidPreferences += 'Staff Wear Masks, ';
        }
        if (dbMasksReq == true) {
          healthCovidPreferences += 'Masks Required, ';
        }
        if (dbStaffGloves == true) {
          healthCovidPreferences += 'Staff Wear Gloves, ';
        }
        if (dbLimitCap == true) {
          healthCovidPreferences += 'Limited Capacity, ';
        }
        if (dbSaniBetwCust == true) {
          healthCovidPreferences += 'Sanitization Between Customers, ';
        }
        if (dbHandSaniGiven == true) {
          healthCovidPreferences += 'Hand Sanitizer Provided ';
        }
        if (dbAnyHealthCovid == true) {
          healthCovidPreferences = 'All';
        }
        // get diet values
        dbDiabeticDiet = value.data()['DiabeticDiet'];
        dbFreshDiet = value.data()['FreshDiet'];
        dbHalalDiet = value.data()['HalalDiet'];
        dbHealthyNotVegetDiet = value.data()['HealthyNotVegetDiet'];
        dbKosherDiet = value.data()['KosherDiet'];
        dbPescatarianDiet = value.data()['PescatarianDiet'];
        dbVeganDiet = value.data()['VeganDiet'];
        dbVegetarianDiet = value.data()['VegetarianDiet'];
        dbAnyDiet = value.data()['AnyDiet'];
        dietPreferences = '';
        if (dbDiabeticDiet == true) {
          dietPreferences += 'Diabetic, ';
        }
        if (dbFreshDiet == true) {
          dietPreferences += 'Fresh, ';
        }
        if (dbHalalDiet == true) {
          dietPreferences += 'Halal, ';
        }
        if (dbHealthyNotVegetDiet == true) {
          dietPreferences += 'Healthy (Not Vegetarian), ';
        }
        if (dbKosherDiet == true) {
          dietPreferences += 'Kosher, ';
        }
        if (dbPescatarianDiet == true) {
          dietPreferences += 'Pescatarian, ';
        }
        if (dbVeganDiet == true) {
          dietPreferences += 'Vegan, ';
        }
        if (dbVegetarianDiet == true) {
          dietPreferences += 'Vegetarian, ';
        }
        if (dbAnyDiet == true) {
          dietPreferences += 'All';
        }
        // get general preferences values
        dbMatchDiet = value.data()['MatchDiet'];
        dbMatchDensity = value.data()['MatchDensity'];
        dbMatchCuisine = value.data()['MatchCuisine'];
        dbGoodForCouples = value.data()['GoodForCouples'];
        dbMatchPayment = value.data()['MatchPayment'];
        dbReqRSVP = value.data()['ReqRSVP'];
        dbGroups5Plus = value.data()['Groups5Plus'];
        dbMatchBudget = value.data()['MatchBudget'];
        dbWaitTime = value.data()['WaitTime'];
        generalFeaturesPreferences = '';
        if (dbMatchDiet == true) {
          generalFeaturesPreferences += 'Match my Diet, ';
        }
        if (dbMatchDensity == true) {
          generalFeaturesPreferences += 'Match my density and ambiance, ';
        }
        if (dbMatchCuisine == true) {
          generalFeaturesPreferences += 'Match my Cuisine, ';
        }
        if (dbMatchDiet == true) {
          generalFeaturesPreferences += 'Match my Diet, ';
        }
        if (dbGoodForCouples == true) {
          generalFeaturesPreferences += 'Good for Couples, ';
        }
        if (dbMatchPayment == true) {
          generalFeaturesPreferences += 'Match my Payments, ';
        }
        if (dbMatchBudget == true) {
          generalFeaturesPreferences += 'Match my Budget, ';
        }
        if (dbReqRSVP == true) {
          generalFeaturesPreferences += 'Locations Require RSVP, ';
        }
        if (dbGroups5Plus == true) {
          generalFeaturesPreferences += 'Locations can handle groups of 5+, ';
        }
        if (dbWaitTime != null) {
          generalFeaturesPreferences += 'Wait time: $dbWaitTime minutes ';
        }
        // get local spot values
        dbLocallyOwned = value.data()['LocallyOwned'];
        dbLocallySourced = value.data()['LocallySourced'];
        dbAnyLocalSpot = value.data()['AnyLocalSpot'];
        localSpotPreferences = '';
        if (dbLocallySourced == true) {
          localSpotPreferences += 'Locally Sourced, ';
        }
        if (dbLocallyOwned == true) {
          localSpotPreferences += 'Locally Owned and Operated ';
        }
        if (dbAnyLocalSpot == true) {
          localSpotPreferences = 'All';
        }
        // get location features values
        dbSpecials = value.data()['Specials'];
        dbOutdoorSeating = value.data()['OutdoorSeating'];
        dbRooftop = value.data()['Rooftop'];
        dbCoverCharge = value.data()['CoverCharge'];
        dbNoCoverCharge = value.data()['NoCoverCharge'];
        dbParking = value.data()['Parking'];
        dbLiveMusic = value.data()['LiveMusic'];
        dbGames = value.data()['Games'];
        dbCasual = value.data()['Casual'];
        dbAccessibility = value.data()['Accessibility'];
        dbCovid19Compliant = value.data()['Covid19Compliant'];
        dbAnyLocalFeatures  = value.data()['AnyLocalFeatures'];
        locationFeaturesPreferences = '';
        if (dbSpecials == true) {
          locationFeaturesPreferences += 'Specials, ';
        }
        if (dbOutdoorSeating == true) {
          locationFeaturesPreferences += 'Outdoor Seating, ';
        }
        if (dbRooftop == true) {
          locationFeaturesPreferences += 'Rooftop, ';
        }
        if (dbCoverCharge == true) {
          locationFeaturesPreferences += 'Cover Charge, ';
        }
        if (dbNoCoverCharge == true) {
          locationFeaturesPreferences += 'No Cover Charge, ';
        }
        if (dbParking == true) {
          locationFeaturesPreferences += 'Parking, ';
        }
        if (dbLiveMusic == true) {
          locationFeaturesPreferences += 'Live Music, ';
        }
        if (dbGames == true) {
          locationFeaturesPreferences += 'Games, ';
        }
        if (dbCasual == true) {
          locationFeaturesPreferences += 'Casual, ';
        }
        if (dbAccessibility == true) {
          locationFeaturesPreferences += 'Accessibility, ';
        }
        if (dbCovid19Compliant == true) {
          locationFeaturesPreferences += 'Covid-19 Compliant, ';
        }
        if (dbAnyLocalFeatures == true) {
          locationFeaturesPreferences = 'All';
        }
        // get payment values
        dbCash = value.data()['Cash'];
        dbCreditDebit = value.data()['CreditDebit'];
        dbApplePay = value.data()['ApplePay'];
        dbGooglePay = value.data()['GooglePay'];
        dbPayPal = value.data()['PayPal'];
        dbCashApp = value.data()['CashApp'];
        dbVenmo = value.data()['Venmo'];
        dbCryptocurrency = value.data()['Cryptocurrency'];
        dbAnyPayment = value.data()['AnyPayment'];
        paymentPreferences = '';
        if (dbCash == true) {
          paymentPreferences += 'Cash ';
        }
        if (dbCreditDebit == true) {
          paymentPreferences += 'CreditDebit ';
        }
        if (dbApplePay == true) {
          paymentPreferences += 'ApplePay ';
        }
        if (dbGooglePay == true) {
          paymentPreferences += 'GooglePay ';
        }
        if (dbPayPal == true) {
          paymentPreferences += 'PayPal ';
        }
        if (dbCashApp == true) {
          paymentPreferences += 'CashApp ';
        }
        if (dbVenmo == true) {
          paymentPreferences += 'Venmo ';
        }
        if (dbCryptocurrency == true) {
          paymentPreferences += 'Cryptocurrency';
        }
        if (dbAnyPayment == true) {
          paymentPreferences += 'All';
        }
        // get relationship values
        dbSingle = value.data()['Single'];
        dbMarried = value.data()['Married'];
        dbInARelationship = value.data()['InARelationship'];
        dbAnyRelationship = value.data()['AnyRelationship'];
        relationshipPreferences = '';
        if (dbSingle == true) {
          relationshipPreferences += 'Single, ';
        }
        if (dbMarried == true) {
          relationshipPreferences += 'Married, ';
        }
        if (dbInARelationship == true) {
          relationshipPreferences += 'In A Relationship';
        }
        if (dbAnyRelationship == true) {
          relationshipPreferences = 'All';
        }
        //get radius values
        dbRadiusLocationDescription = value.data()['RadiusLocationDescription'];
        dbRadiusDistance = value.data()['Radius'];
        radiusPreferences = '';
        if (dbRadiusDistance != null) {
          radiusPreferences += '$dbRadiusDistance miles around ';
        }
        if (dbRadiusLocationDescription != null) {
          radiusPreferences += '$dbRadiusLocationDescription ';
        }
        // ambience and density values
        dbIntimate = value.data()['Intimate'];
        dbAverageDensity = value.data()[''];
        dbComfy = value.data()['Comfy'];
        dbAboveAverageDensity = value.data()['AboveAverageDensity'];
        dbPackedCrowds = value.data()['PackedCrowds'];
        dbSocialDistance = value.data()['SocialDistance'];
        dbAnyDensity = value.data()['AnyDensity'];
        ambianceDensityPreferences = '';
        if (dbIntimate == true) {
          ambianceDensityPreferences += 'Intimate ';
        }
        if (dbComfy == true) {
          ambianceDensityPreferences += 'Comfy, ';
        }
        if (dbAverageDensity == true) {
          ambianceDensityPreferences += 'Average Density, ';
        }
        if (dbAboveAverageDensity == true) {
          ambianceDensityPreferences += 'Above Average Density, ';
        }
        if (dbPackedCrowds == true) {
          ambianceDensityPreferences += 'Packed Crowds, ';
        }
        if (dbSocialDistance == true) {
          ambianceDensityPreferences += 'Social Distance ';
        }
        if (dbAnyDensity == true) {
          ambianceDensityPreferences = 'Any';
        }
        //(context as Element).reassemble();
      });
    } catch (e) {
      // Create user's preferences document in database
      DocumentReference reference =
          FirebaseFirestore.instance.doc("User/" + loggedInUser.toString());
      reference
          .collection("Preferences")
          .doc("Preferences")
          .set({'user_id': _auth.currentUser!.uid});
      print(e);
    }

  }
}
