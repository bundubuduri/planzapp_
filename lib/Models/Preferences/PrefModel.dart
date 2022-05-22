
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:planzapp/Views/Plans/MapSuggestionsScreen.dart';


class PreferencesModel extends ChangeNotifier {

  static double? _dbBudget;
  static double? _dbAboveBudgetPercent;
  static double? _dbBelowBudgetPercent;
  static bool? _dbNotifyPriceInc;
  static bool? _dbNotifyPriceDec;
  static bool? _dbStickToBudget;
  static bool? _dbOutOfBudget;
  static bool? _dbEnableBelowBudget;
  static bool? _dbEnableAboveBudget;
  static String? _budgetPreferences;

  // multiple itineraries values
  static bool? _dbMultiplePlans;
  static String? _multiplePlansPreferences;

  // commute values
  static bool? _dbRideShare;
  static bool? _dbDrive;
  static bool? _dbFlight;
  static bool? _dbTrain;
  static bool? _dbPublicBusMetro;
  static bool? _dbWalk;
  static bool? _dbAnyCommute;
  static String? _commutePreferences;

  // cuisine values
  static bool? _dbAfricanCuisine;
  static bool? _dbAmericanCuisine;
  static bool? _dbBarbequeCuisine;
  static bool? _dbBrazilianCuisine;
  static bool? _dbCaribbeanCuisine;
  static bool? _dbChineseCuisine;
  static bool? _dbFrenchCuisine;
  static bool? _dbGreekCuisine;
  static bool? _dbIndianCuisine;
  static bool? _dbItalianCuisine;
  static bool? _dbJapaneseCuisine;
  static bool? _dbMediterraneanCuisine;
  static bool? _dbMexicanCuisine;
  static bool? _dbThaiCuisine;
  static bool? _dbSoulFoodCuisine;
  static bool? _dbBrunchCuisine;
  static bool? _dbBuffetCuisine;
  static bool? _dbDessertsCuisine;
  static bool? _dbSandwichesCuisine;
  static bool? _dbNoodlesCuisine;
  static bool? _dbSeafoodCuisine;
  static bool? _dbVietnameseCuisine;
  static bool? _dbTurkishCuisine;
  static bool? _dbAnyCuisine;
  static String? _cuisinePreferences;

  // health and covid values
  static bool? _dbNoContactPay;
  static bool? _dbNoContactDelivery;
  static bool? _dbStaffMasks;
  static bool? _dbMasksReq;
  static bool? _dbStaffGloves;
  static bool? _dbLimitCap;
  static bool? _dbSaniBetwCust;
  static bool? _dbHandSaniGiven;
  static bool? _dbAnyHealthCovid;
  static String? _healthCovidPreferences;

  // diet values
  static bool? _dbDiabeticDiet;
  static bool? _dbFreshDiet;
  static bool? _dbHalalDiet;
  static bool? _dbHealthyNotVegetDiet;
  static bool? _dbKosherDiet;
  static bool? _dbPescatarianDiet;
  static bool? _dbVeganDiet;
  static bool? _dbVegetarianDiet;
  static bool? _dbAnyDiet;
  static String? _dietPreferences;

  // general values
  static bool? _dbMatchDiet;
  static bool? _dbMatchDensity;
  static bool? _dbMatchCuisine;
  static bool? _dbGoodForCouples;
  static bool? _dbMatchPayment;
  static bool? _dbReqRSVP;
  static bool? _dbGroups5Plus;
  static bool? _dbMatchBudget;
  static double? _dbWaitTime;
  static String? _generalFeaturesPreferences;

  // local spot values
  static bool? _dbLocallyOwned;
  static bool? _dbLocallySourced;
  static bool? _dbAllLocalSpot;
  static String? _localSpotPreferences;

  // location features values
  static bool? _dbSpecials;
  static bool? _dbOutdoorSeating;
  static bool? _dbRooftop;
  static bool? _dbCoverCharge;
  static bool? _dbNoCoverCharge;
  static bool? _dbParking;
  static bool? _dbLiveMusic;
  static bool? _dbGames;
  static bool? _dbCasual;
  static bool? _dbAccessibility;
  static bool? _dbCovid19Compliant;
  static bool? _dbAnyLocalFeatures;
  static String? _locationFeaturesPreferences;

  // payment values
  static bool? _dbCash;
  static bool? _dbCreditDebit;
  static bool? _dbApplePay;
  static bool? _dbGooglePay;
  static bool? _dbPayPal;
  static bool? _dbCashApp;
  static bool? _dbVenmo;
  static bool? _dbCryptocurrency;
  static bool? _dbAnyPayment;
  static String? _paymentPreferences;

  // relationship values
  static bool? _dbSingle;
  static bool? _dbMarried;
  static bool? _dbInARelationship;
  static bool? _dbAnyRelationship;
  static String? _relationshipPreferences;

  // radius values
  static double? _dbRadiusDistance;
  static Place? _dbRadiusLocationDescription;
  static Place? _dbRadiusLatLong;
  static String? _radiusPreferences;


  // ambience and density values
  static bool? _dbIntimate;
  static bool? _dbAverageDensity;
  static bool? _dbComfy;
  static bool? _dbAboveAverageDensity;
  static bool? _dbPackedCrowds;
  static bool? _dbSocialDistance;
  static bool? _dbAnyDensity;
  static String? _ambianceDensityPreferences;

  //reset values for each preference page
  static bool? _dbResetAmbiDensityValue;
  static bool? _dbResetCommuteValue;
  static bool? _dbResetCuisineValue;
  static bool? _dbResetDietValue;
  static bool? _dbResetHealthCovidValue;
  static bool? _dbResetLocalSpotValue;
  static bool? _dbResetLocationFeaturesValue;
  static bool? _dbResetPaymentsValue;
  static bool? _dbResetRelatValue;





  PreferencesModel() {
    setup();
  }

  void setup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _dbBudget = prefs.getDouble('Budget') ?? 0.0;
  _dbAboveBudgetPercent = prefs.getDouble('AboveBudgetPercent') ?? 0.0;
_dbBelowBudgetPercent = prefs.getDouble('BelowBudgetPercent') ?? 0.0;
_dbNotifyPriceInc = prefs.getBool('NotifyPriceIncrease') ?? false;
_dbNotifyPriceDec = prefs.getBool('NotifyPriceDecrease') ?? false;
_dbStickToBudget = prefs.getBool('StickToBudget') ?? false;
_dbOutOfBudget = prefs.getBool('OutOfBudget') ?? false;
    _dbEnableAboveBudget = prefs.getBool('EnableAboveBudget') ?? false;
_dbEnableBelowBudget = prefs.getBool('EnableBelowBudget') ?? false;
_budgetPreferences = prefs.getString('budgetPreferences') ?? '';

  // multiple itineraries values
  _dbMultiplePlans = prefs.getBool('') ?? false;
  _multiplePlansPreferences = prefs.getString('multiplePlansPreferences') ?? '';

  // commute values
  _dbRideShare = prefs.getBool('RideShare') ?? false;
_dbDrive = prefs.getBool('Drive') ?? false;
_dbFlight = prefs.getBool('Flight') ?? false;
_dbTrain = prefs.getBool('Train') ?? false;
_dbPublicBusMetro = prefs.getBool('PublicBusMetro') ?? false;
_dbWalk = prefs.getBool('Walk') ?? false;
_dbAnyCommute = prefs.getBool('AnyCommute') ?? false;
_dbResetCommuteValue =  prefs.getBool('ResetCommute') ?? false;
_commutePreferences = prefs.getString('commutePreferences') ?? '';

  // cuisine values
  _dbAfricanCuisine = prefs.getBool('AfricanCuisine') ?? false;
_dbAmericanCuisine = prefs.getBool('AmericanCuisine') ?? false;
_dbBarbequeCuisine = prefs.getBool('BarbequeCuisine') ?? false;
_dbBrazilianCuisine = prefs.getBool('BrazilianCuisine') ?? false;
_dbCaribbeanCuisine = prefs.getBool('CaribbeanCuisine') ?? false;
_dbChineseCuisine = prefs.getBool('ChineseCuisine') ?? false;
_dbFrenchCuisine = prefs.getBool('FrenchCuisine') ?? false;
_dbGreekCuisine = prefs.getBool('GreekCuisine') ?? false;
_dbIndianCuisine = prefs.getBool('IndianCuisine') ?? false;
_dbItalianCuisine = prefs.getBool('ItalianCuisine') ?? false;
_dbJapaneseCuisine = prefs.getBool('JapaneseCuisine') ?? false;
_dbMediterraneanCuisine = prefs.getBool('MediterraneanCuisine') ?? false;
_dbMexicanCuisine = prefs.getBool('MexicanCuisine') ?? false;
_dbThaiCuisine = prefs.getBool('ThaiCuisine') ?? false;
_dbSoulFoodCuisine = prefs.getBool('SoulFoodCuisine') ?? false;
_dbBrunchCuisine = prefs.getBool('BrunchCuisine') ?? false;
_dbBuffetCuisine = prefs.getBool('BuffetCuisine') ?? false;
_dbDessertsCuisine = prefs.getBool('DessertsCuisine') ?? false;
_dbSandwichesCuisine = prefs.getBool('SandwichesCuisine') ?? false;
_dbNoodlesCuisine = prefs.getBool('NoodlesCuisine') ?? false;
_dbSeafoodCuisine = prefs.getBool('SeafoodCuisine') ?? false;
_dbVietnameseCuisine = prefs.getBool('VietnameseCuisine') ?? false;
_dbTurkishCuisine = prefs.getBool('TurkishCuisine') ?? false;
_dbAnyCuisine = prefs.getBool('AnyCuisine') ?? false;
_dbResetCuisineValue =prefs.getBool('Reset') ?? false;
_cuisinePreferences = prefs.getString('cuisinePreferences') ?? '';

  // health and covid values
  _dbNoContactPay = prefs.getBool('NoContactPay') ?? false;
_dbNoContactDelivery = prefs.getBool('NoContactDelivery') ?? false;
_dbStaffMasks = prefs.getBool('StaffMasks') ?? false;
_dbMasksReq = prefs.getBool('MasksReq') ?? false;
_dbStaffGloves = prefs.getBool('StaffGloves') ?? false;
_dbLimitCap = prefs.getBool('LimitCap') ?? false;
_dbSaniBetwCust = prefs.getBool('SaniBetwCust') ?? false;
_dbHandSaniGiven = prefs.getBool('HandSaniGiven') ?? false;
_dbAnyHealthCovid = prefs.getBool('AnyHealthCovid') ?? false;
_dbResetHealthCovidValue = prefs.getBool('Reset') ?? false;
_healthCovidPreferences = prefs.getString('healthCovidPreferences') ?? '';

  // diet values
_dbDiabeticDiet = prefs.getBool('DiabeticDiet') ?? false;
_dbFreshDiet = prefs.getBool('FreshDiet') ?? false;
_dbHalalDiet = prefs.getBool('HalalDiet') ?? false;
_dbHealthyNotVegetDiet = prefs.getBool('HealthyNotVegetDiet') ?? false;
_dbKosherDiet = prefs.getBool('KosherDiet') ?? false;
_dbPescatarianDiet = prefs.getBool('PescatarianDiet') ?? false;
_dbVeganDiet = prefs.getBool('VeganDiet') ?? false;
_dbVegetarianDiet = prefs.getBool('VegetarianDiet') ?? false;
_dbAnyDiet = prefs.getBool('AnyDiet') ?? false;
_dbResetDietValue = prefs.getBool('Reset') ?? false;
_dietPreferences = prefs.getString('dietPreferences') ?? '';

  // general values
  _dbMatchDiet = prefs.getBool('MatchDiet') ?? false;
  _dbMatchDensity = prefs.getBool('MatchDensity') ?? false;
  _dbMatchCuisine = prefs.getBool('MatchCuisine') ?? false;
  _dbGoodForCouples = prefs.getBool('GoodForCouples') ?? false;
  _dbMatchPayment = prefs.getBool('MatchPayment') ?? false;
  _dbReqRSVP = prefs.getBool('ReqRSVP') ?? false;
  _dbGroups5Plus = prefs.getBool('Groups5Plus') ?? false;
  _dbMatchBudget = prefs.getBool('MatchBudget') ?? false;
  _dbWaitTime = prefs.getDouble('WaitTime') ?? 0.0;
  _generalFeaturesPreferences = prefs.getString('generalFeaturesPreferences') ?? '';

  // local spot values
  _dbLocallyOwned = prefs.getBool('LocallyOwned') ?? false;
  _dbLocallySourced = prefs.getBool('LocallySourced') ?? false;
  _dbAllLocalSpot = prefs.getBool('AnyLocalSpot') ?? false;
  _dbResetLocalSpotValue = prefs.getBool('Reset') ?? false;
  _localSpotPreferences = prefs.getString('localSpotPreferences') ?? '';

  // location features values
  _dbSpecials = prefs.getBool('Specials') ?? false;
  _dbOutdoorSeating = prefs.getBool('OutdoorSeating') ?? false;
  _dbRooftop = prefs.getBool('Rooftop') ?? false;
  _dbCoverCharge = prefs.getBool('CoverCharge') ?? false;
  _dbNoCoverCharge = prefs.getBool('NoCoverCharge') ?? false;
  _dbParking = prefs.getBool('Parking') ?? false;
  _dbLiveMusic = prefs.getBool('LiveMusic') ?? false;
  _dbGames = prefs.getBool('Games') ?? false;
  _dbCasual = prefs.getBool('Casual') ?? false;
  _dbAccessibility = prefs.getBool('Accessibility') ?? false;
  _dbCovid19Compliant = prefs.getBool('Covid19Compliant') ?? false;
  _dbAnyLocalFeatures = prefs.getBool('AnyLocalFeatures') ?? false;
  _dbResetLocationFeaturesValue = prefs.getBool('Reset') ?? false;
  _locationFeaturesPreferences = prefs.getString('locationFeaturesPreferences') ?? '';

  // payment values
  _dbCash = prefs.getBool('Cash') ?? false;
  _dbCreditDebit = prefs.getBool('CreditDebit') ?? false;
  _dbApplePay = prefs.getBool('ApplePay') ?? false;
  _dbGooglePay = prefs.getBool('GooglePay') ?? false;
  _dbPayPal = prefs.getBool('PayPal') ?? false;
  _dbCashApp = prefs.getBool('CashApp') ?? false;
  _dbVenmo = prefs.getBool('Venmo') ?? false;
  _dbCryptocurrency = prefs.getBool('Cryptocurrency') ?? false;
  _dbAnyPayment = prefs.getBool('AnyPayment') ?? false;
  _dbResetPaymentsValue = prefs.getBool('Reset') ?? false;
  _paymentPreferences = prefs.getString('paymentPreferences') ?? '';

  // relationship values
  _dbSingle = prefs.getBool('Single') ?? false;
  _dbMarried = prefs.getBool('Married') ?? false;
  _dbInARelationship = prefs.getBool('InARelationship') ?? false;
  _dbAnyRelationship = prefs.getBool('AnyRelationship') ?? false;
  _dbResetRelatValue = prefs.getBool('ResetRelationship') ?? false;
  _relationshipPreferences = prefs.getString('Preferences') ?? '';

  // radius values
  _dbRadiusDistance = prefs.getDouble('RadiusDistance') ?? 0.0;
  Place? _dbRadiusLocationDescription;
  Place _dbRadiusLatLong;
  _radiusPreferences = prefs.getString('radiusPreferences') ?? '';


  // ambience and density values
  _dbIntimate = prefs.getBool('Intimate') ?? false;
  _dbAverageDensity = prefs.getBool('AverageDensity') ?? false;
  _dbComfy = prefs.getBool('Comfy') ?? false;
  _dbAboveAverageDensity = prefs.getBool('AboveAverageDensity') ?? false;
  _dbPackedCrowds = prefs.getBool('PackedCrowds') ?? false;
  _dbSocialDistance = prefs.getBool('SocialDistance') ?? false;
  _dbAnyDensity = prefs.getBool('AnyDensity') ?? false;
  _dbResetAmbiDensityValue = prefs.getBool('ResetDensity') ?? false;
  _ambianceDensityPreferences = prefs.getString('ambianceDensityPreferences') ?? '';


    _budgetPreferences = '';
    if (_dbBudget != null) {
      _budgetPreferences += '\$$_dbBudget ';
    }
    if (_dbAboveBudgetPercent != null && _dbEnableAboveBudget == true) {
      _budgetPreferences += '(+ $_dbAboveBudgetPercent%) ' ;
    }
    if (_dbBelowBudgetPercent != null && _dbEnableBelowBudget == true) {
      _budgetPreferences += '(- $_dbBelowBudgetPercent%) ' ;
    }
    if (_dbStickToBudget == true) {
      _budgetPreferences += 'Stick to my budget, ';
    }
    if (_dbOutOfBudget == true) {
      _budgetPreferences += 'View plans outside of budget, ';
    }
    if (_dbNotifyPriceInc == true) {
      _budgetPreferences += 'Notify me of price increases in plans, ';
    }
    if (_dbNotifyPriceDec == true) {
      _budgetPreferences += 'Notify me of price decreases in plans ';
    }
    prefs.setString('budgetPreferences', _budgetPreferences!);

    _commutePreferences = '';
    if (_dbRideShare == true) {
      _commutePreferences += 'Ride Share';
    }
    if (_dbDrive == true) {
      _commutePreferences += 'Drive, ';
    }
    if (_dbFlight == true) {
      _commutePreferences += 'Flight, ';
    }
    if (_dbTrain == true) {
      _commutePreferences += 'Train, ';
    }
    if (_dbPublicBusMetro == true) {
      _commutePreferences += 'Public Bus/Metro, ';
    }
    if (_dbWalk == true) {
      _commutePreferences += 'Walk, ';
    }
    if (_dbAnyCommute == true) {
      _commutePreferences = 'All';
    }
    prefs.setString('commutePreferences', _commutePreferences!);

    _cuisinePreferences = '';
    if (_dbAfricanCuisine == true) {
      _cuisinePreferences += 'African, ';
    }
    if (_dbAmericanCuisine == true) {
      _cuisinePreferences += 'American, ';
    }
    if (_dbBarbequeCuisine == true) {
      _cuisinePreferences += 'Barbeque, ';
    }
    if (_dbBrazilianCuisine == true) {
      _cuisinePreferences += 'Brazilian, ';
    }
    if (_dbCaribbeanCuisine == true) {
      _cuisinePreferences += 'Caribbean, ';
    }
    if (_dbChineseCuisine == true) {
      _cuisinePreferences += 'Chinese, ';
    }
    if (_dbFrenchCuisine == true) {
      _cuisinePreferences += 'French, ';
    }
    if (_dbGreekCuisine == true) {
      _cuisinePreferences += 'Greek, ';
    }
    if (_dbIndianCuisine == true) {
      _cuisinePreferences += 'Indian, ';
    }
    if (_dbItalianCuisine == true) {
      _cuisinePreferences += 'Italian, ';
    }
    if (_dbJapaneseCuisine == true) {
      _cuisinePreferences += 'Japanese, ';
    }
    if (_dbMediterraneanCuisine == true) {
      _cuisinePreferences += 'Mediterranean, ';
    }
    if (_dbMexicanCuisine == true) {
      _cuisinePreferences += 'Mexican, ';
    }
    if (_dbThaiCuisine == true) {
      _cuisinePreferences += 'Thai, ';
    }
    if (_dbSoulFoodCuisine == true) {
      _cuisinePreferences += 'Soul Food, ';
    }
    if (_dbBrunchCuisine == true) {
      _cuisinePreferences += 'Brunch, ';
    }
    if (_dbBuffetCuisine == true) {
      _cuisinePreferences += 'Buffet, ';
    }
    if (_dbDessertsCuisine == true) {
      _cuisinePreferences += 'Desserts, ';
    }
    if (_dbSandwichesCuisine == true) {
      _cuisinePreferences += 'Sandwiches, ';
    }
    if (_dbNoodlesCuisine == true) {
      _cuisinePreferences += 'Noodles, ';
    }
    if (_dbSeafoodCuisine == true) {
      _cuisinePreferences += 'Seafood, ';
    }
    if (_dbVietnameseCuisine == true) {
      _cuisinePreferences += 'Vietnamese, ';
    }
    if (_dbTurkishCuisine == true) {
      _cuisinePreferences += 'Turkish ';
    }
    if (_dbAnyCuisine == true) {
      _cuisinePreferences = 'All';
    }
    prefs.setString('cuisinePreferences', _cuisinePreferences!);

    _healthCovidPreferences = '';
    if (_dbNoContactPay == true) {
      _healthCovidPreferences += 'No Contact Payment, ';
    }
    if (_dbNoContactDelivery == true) {
      _healthCovidPreferences += 'No Contact Delivery, ';
    }
    if (_dbStaffMasks == true) {
      _healthCovidPreferences += 'Staff Wear Masks, ';
    }
    if (_dbMasksReq == true) {
      _healthCovidPreferences += 'Masks Required, ';
    }
    if (_dbStaffGloves == true) {
      _healthCovidPreferences += 'Staff Wear Gloves, ';
    }
    if (_dbLimitCap == true) {
      _healthCovidPreferences += 'Limited Capacity, ';
    }
    if (_dbSaniBetwCust == true) {
      _healthCovidPreferences += 'Sanitization Between Customers, ';
    }
    if (_dbHandSaniGiven == true) {
      _healthCovidPreferences += 'Hand Sanitizer Provided ';
    }
    if (_dbAnyHealthCovid == true) {
      _healthCovidPreferences = 'All';
    }
    prefs.setString('healthCovidPreferences', _healthCovidPreferences!);

    _dietPreferences = '';
    if (_dbDiabeticDiet == true) {
      _dietPreferences += 'Diabetic, ';
    }
    if (_dbFreshDiet == true) {
      _dietPreferences += 'Fresh, ';
    }
    if (_dbHalalDiet == true) {
      _dietPreferences += 'Halal, ';
    }
    if (_dbHealthyNotVegetDiet == true) {
      _dietPreferences += 'Healthy (Not Vegetarian), ';
    }
    if (_dbKosherDiet == true) {
      _dietPreferences += 'Kosher, ';
    }
    if (_dbPescatarianDiet == true) {
      _dietPreferences += 'Pescatarian, ';
    }
    if (_dbVeganDiet == true) {
      _dietPreferences += 'Vegan, ';
    }
    if (_dbVegetarianDiet == true) {
      _dietPreferences += 'Vegetarian, ';
    }
    if (_dbAnyDiet == true) {
      _dietPreferences = 'All';
    }
    prefs.setString('dietPreferences', _dietPreferences!);


    _generalFeaturesPreferences = '';
    if (_dbMatchDiet == true) {
      _generalFeaturesPreferences += 'Match my Diet, ';
    }
    if (_dbMatchDensity == true) {
      _generalFeaturesPreferences += 'Match my density and _ambiance, ';
    }
    if (_dbMatchCuisine == true) {
      _generalFeaturesPreferences += 'Match my Cuisine, ';
    }
    if (_dbMatchDiet == true) {
      _generalFeaturesPreferences += 'Match my Diet, ';
    }
    if (_dbGoodForCouples == true) {
      _generalFeaturesPreferences += 'Good for Couples, ';
    }
    if (_dbMatchPayment == true) {
      _generalFeaturesPreferences += 'Match my Payments, ';
    }
    if (_dbMatchBudget == true) {
      _generalFeaturesPreferences += 'Match my Budget, ';
    }
    if (_dbReqRSVP == true) {
      _generalFeaturesPreferences += 'Locations Require RSVP, ';
    }
    if (_dbGroups5Plus == true) {
      _generalFeaturesPreferences += 'Locations can handle groups of 5+, ';
    }
    if (_dbWaitTime != null) {
      _generalFeaturesPreferences += 'Wait time: $_dbWaitTime minutes ';
    }
    prefs.setString('generalFeaturesPreferences', _generalFeaturesPreferences!);

    _localSpotPreferences = '';
    if (_dbLocallySourced == true) {
      _localSpotPreferences += 'Locally Sourced, ';
    }
    if (_dbLocallyOwned == true) {
      _localSpotPreferences += 'Locally Owned and Operated ';
    }
    if (_dbAllLocalSpot == true) {
      _localSpotPreferences = 'All';
    }
    prefs.setString('localSpotPreferences', _localSpotPreferences!);
    
    _locationFeaturesPreferences = '';
    if (_dbSpecials == true) {
      _locationFeaturesPreferences += 'Specials, ';
    }
    if (_dbOutdoorSeating == true) {
      _locationFeaturesPreferences += 'Outdoor Seating, ';
    }
    if (_dbRooftop == true) {
      _locationFeaturesPreferences += 'Rooftop, ';
    }
    if (_dbCoverCharge == true) {
      _locationFeaturesPreferences += 'Cover Charge, ';
    }
    if (_dbNoCoverCharge == true) {
      _locationFeaturesPreferences += 'No Cover Charge, ';
    }
    if (_dbParking == true) {
      _locationFeaturesPreferences += 'Parking, ';
    }
    if (_dbLiveMusic == true) {
      _locationFeaturesPreferences += 'Live Music, ';
    }
    if (_dbGames == true) {
      _locationFeaturesPreferences += 'Games, ';
    }
    if (_dbCasual == true) {
      _locationFeaturesPreferences += 'Casual, ';
    }
    if (_dbAccessibility == true) {
      _locationFeaturesPreferences += 'Accessibility, ';
    }
    if (_dbCovid19Compliant == true) {
      _locationFeaturesPreferences += 'Covid-19 Compliant, ';
    }
    if (_dbAnyLocalFeatures == true) {
      _locationFeaturesPreferences = 'All';
    }
    if (_dbResetLocationFeaturesValue == true){
      _dbResetLocationFeaturesValue == 'All';
    }
    prefs.setString('locationFeaturesPreferences', _locationFeaturesPreferences!);
    
    _paymentPreferences = '';
    if (_dbCash == true) {
      _paymentPreferences += 'Cash ';
    }
    if (_dbCreditDebit == true) {
      _paymentPreferences += 'CreditDebit ';
    }
    if (_dbApplePay == true) {
      _paymentPreferences += 'ApplePay ';
    }
    if (_dbGooglePay == true) {
      _paymentPreferences += 'GooglePay ';
    }
    if (_dbPayPal == true) {
      _paymentPreferences += 'PayPal ';
    }
    if (_dbCashApp == true) {
      _paymentPreferences += 'CashApp ';
    }
    if (_dbVenmo == true) {
      _paymentPreferences += 'Venmo ';
    }
    if (_dbCryptocurrency == true) {
      _paymentPreferences += 'Cryptocurrency';
    }
    if (_dbAnyPayment == true) {
      _paymentPreferences = 'All';
    }
    prefs.setString('paymentPreferences', _paymentPreferences!);

    _relationshipPreferences = '';
    if (_dbSingle == true) {
      _relationshipPreferences += 'Single, ';
    }
    if (_dbMarried == true) {
      _relationshipPreferences += 'Married, ';
    }
    if (_dbInARelationship == true) {
      _relationshipPreferences += 'In A Relationship';
    }
    if (_dbAnyRelationship == true) {
      _relationshipPreferences = 'All';
    }

    prefs.setString('relationshipPreferences', _relationshipPreferences!);

    _radiusPreferences = '';
    if (_dbRadiusDistance != null) {
      _radiusPreferences += '$_dbRadiusDistance miles around ';
    }
    if (_dbRadiusLocationDescription != null) {
      _radiusPreferences += '$_dbRadiusLocationDescription ';
    }
    prefs.setString('radiusPreferences', _radiusPreferences!);

    _ambianceDensityPreferences = '';
    if (_dbIntimate == true) {
      _ambianceDensityPreferences += 'Intimate ';
    }
    if (_dbComfy == true) {
      _ambianceDensityPreferences += 'Comfy, ';
    }
    if (_dbAverageDensity == true) {
      _ambianceDensityPreferences += 'Average Density, ';
    }
    if (_dbAboveAverageDensity == true) {
      _ambianceDensityPreferences += 'Above Average Density, ';
    }
    if (_dbPackedCrowds == true) {
      _ambianceDensityPreferences += 'Packed Crowds, ';
    }
    if (_dbSocialDistance == true) {
      _ambianceDensityPreferences += 'Social Distance ';
    }
    if (_dbAnyDensity == true) {
      _ambianceDensityPreferences = 'All';
    }
    prefs.setString('ambianceDensityPreferences', _ambianceDensityPreferences!);

    multiplePlansPreferences = '';
    if (_dbMultiplePlans == true) {
      _multiplePlansPreferences = 'Allowed';
    }
    if (dbMultiplePlans == false) {
      _multiplePlansPreferences += 'Not Allowed';
    }
  }



  String? get budgetPreferences => _budgetPreferences;
  set budgetPreferences (String? budgetPreferences) {
    _budgetPreferences = budgetPreferences;
    notifyListeners();
  }

  
  String? get multiplePlansPreferences => _multiplePlansPreferences;
  set multiplePlansPreferences (String? multiplePlansPreferences) {
    _multiplePlansPreferences = multiplePlansPreferences;
    notifyListeners();
  }

  
  String? get commutePreferences => _commutePreferences;
  set commutePreferences (String? commutePreferences) {
    _commutePreferences = commutePreferences;
    notifyListeners();
  }

  
  String? get cuisinePreferences => _cuisinePreferences;
  set cuisinePreferences (String? cuisinePreferences) {
    _cuisinePreferences = cuisinePreferences;
    notifyListeners();
  }

  
  String? get healthCovidPreferences => _healthCovidPreferences;
  set healthCovidPreferences (String? healthCovidPreferences) {
    _healthCovidPreferences = healthCovidPreferences;
    notifyListeners();
  }

  
  String? get dietPreferences => _dietPreferences;
  set dietPreferences(String? dietPreferences) {
    _dietPreferences = dietPreferences;
    notifyListeners();
  }

  
  String? get generalFeaturesPreferences => _generalFeaturesPreferences;
  set generalFeaturesPreferences (String? generalFeaturesPreferences) {
    _generalFeaturesPreferences = generalFeaturesPreferences;
    notifyListeners();
  }

  
  String? get localSpotPreferences => _localSpotPreferences;
  set localSpotPreferences (String? localSpotPreferences) {
    _localSpotPreferences = localSpotPreferences;
    notifyListeners();
  }

  
  String? get locationFeaturesPreferences => _locationFeaturesPreferences;
  set locationFeaturesPreferences (String? locationFeaturesPreferences) {
    _locationFeaturesPreferences = locationFeaturesPreferences;
    notifyListeners();
  }

  
  String? get paymentPreferences => _paymentPreferences;
  set paymentPreferences (String? paymentPreferences) {
    _paymentPreferences = paymentPreferences;
    notifyListeners();
  }

  
  String? get relationshipPreferences => _relationshipPreferences;
  set relationshipPreferences (String? relationshipPreferences) {
    _relationshipPreferences = relationshipPreferences;
    notifyListeners();
  }

  
  String? get radiusPreferences => _radiusPreferences;
  set radiusPreferences (String? radiusPreferences) {
    _radiusPreferences = radiusPreferences;
    notifyListeners();
  }

  
  String? get ambianceDensityPreferences => _ambianceDensityPreferences;
  set ambianceDensityPreferences (String? ambianceDensityPreferences) {
    _ambianceDensityPreferences = ambianceDensityPreferences;
    notifyListeners();
  }

  // Budget Data
  double? get dbBudget => _dbBudget;
  set dbBudget (double? dbBudget) {
    _dbBudget = dbBudget;
    notifyListeners();
  }

  changeBudget(double dbBudget) {
    _dbBudget = dbBudget;
    notifyListeners();
  }


  // AboveBudgetPercent Data
  double? get dbAboveBudgetPercent => _dbAboveBudgetPercent;
  set dbAboveBudgetPercent (double? dbAboveBudgetPercent) {
    _dbAboveBudgetPercent = dbAboveBudgetPercent;
    notifyListeners();
  }

  toggleAboveBudgetPercent() {
    //_dbAboveBudgetPercent = !_dbAboveBudgetPercent;
    notifyListeners();
  }

  // BelowBudgetPercent Data
  double? get dbBelowBudgetPercent => _dbBelowBudgetPercent;
  set dbBelowBudgetPercent (double? dbBelowBudgetPercent) {
    _dbBelowBudgetPercent = dbBelowBudgetPercent;
    notifyListeners();
  }

  toggleBelowBudgetPercent() {
    //_dbBelowBudgetPercent = !_dbBelowBudgetPercent;
    notifyListeners();
  }

  // NotifyPriceInc Data
  bool? get dbNotifyPriceInc => _dbNotifyPriceInc;
  set dbNotifyPriceInc (bool? dbNotifyPriceInc) {
    _dbNotifyPriceInc = dbNotifyPriceInc;
    notifyListeners();
  }

  toggleNotifyPriceInc() {
    _dbNotifyPriceInc = !_dbNotifyPriceInc!;
    notifyListeners();
  }

  // NotifyPriceDec Data
  bool? get dbNotifyPriceDec => _dbNotifyPriceDec;
  set dbNotifyPriceDec (bool? dbNotifyPriceDec) {
    _dbNotifyPriceDec = dbNotifyPriceDec;
    notifyListeners();
  }

  toggleNotifyPriceDec() {
    _dbNotifyPriceDec = !_dbNotifyPriceDec!;
    notifyListeners();
  }

  // StickToBudget Data
  bool? get dbStickToBudget => _dbStickToBudget;
  set dbStickToBudget (bool? dbStickToBudget) {
    _dbStickToBudget = dbStickToBudget;
    notifyListeners();
  }

  toggleStickToBudget() {
    _dbStickToBudget = !_dbStickToBudget!;
    notifyListeners();
  }

  // OutOfBudget Data
  bool? get dbOutOfBudget => _dbOutOfBudget;
  set dbOutOfBudget (bool? dbOutOfBudget) {
    _dbOutOfBudget = dbOutOfBudget;
    notifyListeners();
  }

  toggleOutOfBudget() {
    _dbOutOfBudget = !_dbOutOfBudget!;
    notifyListeners();
  }

  // EnableBelowBudget Data
  bool? get dbEnableBelowBudget => _dbEnableBelowBudget;
  set dbEnableBelowBudget (bool? dbEnableBelowBudget) {
    _dbEnableBelowBudget = dbEnableBelowBudget;
    notifyListeners();
  }

  toggleEnableBelowBudget() {
    _dbEnableBelowBudget = !_dbEnableBelowBudget!;
    notifyListeners();
  }

  // EnableAboveBudget Data
  bool? get dbEnableAboveBudget => _dbEnableAboveBudget;
  set dbEnableAboveBudget (bool? dbEnableAboveBudget) {
    _dbEnableAboveBudget = dbEnableAboveBudget;
    notifyListeners();
  }

  toggleEnableAboveBudget() {
    _dbEnableAboveBudget = !_dbEnableAboveBudget!;
    notifyListeners();
  }

  // MultiplePlans Data
  bool? get dbMultiplePlans => _dbMultiplePlans;
  set dbMultiplePlans (bool? dbMultiplePlans) {
    _dbMultiplePlans = dbMultiplePlans;
    notifyListeners();
  }

  toggleMultiplePlans() {
    _dbMultiplePlans = !_dbMultiplePlans!;
    notifyListeners();
  }

  // RideShare Data
  bool? get dbRideShare => _dbRideShare;
  set dbRideShare (bool? dbRideShare) {
    _dbRideShare = dbRideShare;
    notifyListeners();
  }

  toggleRideShare() {
    _dbRideShare = !_dbRideShare!;
    notifyListeners();
  }

  // Drive Data
  bool? get dbDrive => _dbDrive;
  set dbDrive (bool? dbDrive) {
    _dbDrive = dbDrive;
    notifyListeners();
  }

  toggleDrive() {
    _dbDrive = !_dbDrive!;
    notifyListeners();
  }

  // Flight Data
  bool? get dbFlight => _dbFlight;
  set dbFlight (bool? dbFlight) {
    _dbFlight = dbFlight;
    notifyListeners();
  }

  toggleFlight() {
    _dbFlight = !_dbFlight!;
    notifyListeners();
  }

  // Train Data
  bool? get dbTrain => _dbTrain;
  set dbTrain (bool? dbTrain) {
    _dbTrain = dbTrain;
    notifyListeners();
  }

  toggleTrain() {
    _dbTrain = !_dbTrain!;
    notifyListeners();
  }

  // PublicBusMetro Data
  bool? get dbPublicBusMetro => _dbPublicBusMetro;
  set dbPublicBusMetro (bool? dbPublicBusMetro) {
    _dbPublicBusMetro = dbPublicBusMetro;
    notifyListeners();
  }

  togglePublicBusMetro() {
    _dbPublicBusMetro = !_dbPublicBusMetro!;
    notifyListeners();
  }

  // Walk Data
  bool? get dbWalk => _dbWalk;
  set dbWalk (bool? dbWalk) {
    _dbWalk = dbWalk;
    notifyListeners();
  }

  toggleWalk() {
    _dbWalk = !_dbWalk!;
    notifyListeners();
  }

  // AnyCommute Data
  bool? get dbAnyCommute => _dbAnyCommute;
  set dbAnyCommute (bool? dbAnyCommute) {
    _dbAnyCommute = dbAnyCommute;
    notifyListeners();
  }

  toggleAnyCommute() {
    _dbAnyCommute = !_dbAnyCommute!;
    notifyListeners();
  }

  // AfricanCuisine Data
  bool? get dbAfricanCuisine => _dbAfricanCuisine;
  set dbAfricanCuisine (bool? dbAfricanCuisine) {
    _dbAfricanCuisine = dbAfricanCuisine;
    notifyListeners();
  }

  toggleAfricanCuisine() {
    _dbAfricanCuisine = !_dbAfricanCuisine!;
    notifyListeners();
  }

  // AmericanCuisine Data
  bool? get dbAmericanCuisine => _dbAmericanCuisine;
  set dbAmericanCuisine (bool? dbAmericanCuisine) {
    _dbAmericanCuisine = dbAmericanCuisine;
    notifyListeners();
  }

  toggleAmericanCuisine() {
    _dbAmericanCuisine = !_dbAmericanCuisine!;
    notifyListeners();
  }

  // BarbequeCuisine Data
  bool? get dbBarbequeCuisine => _dbBarbequeCuisine;
  set dbBarbequeCuisine (bool? dbBarbequeCuisine) {
    _dbBarbequeCuisine = dbBarbequeCuisine;
    notifyListeners();
  }

  toggleBarbequeCuisine() {
    _dbBarbequeCuisine = !_dbBarbequeCuisine!;
    notifyListeners();
  }

  // BrazilianCuisine Data
  bool? get dbBrazilianCuisine => _dbBrazilianCuisine;
  set dbBrazilianCuisine (bool? dbBrazilianCuisine) {
    _dbBrazilianCuisine = dbBrazilianCuisine;
    notifyListeners();
  }

  toggleBrazilianCuisine() {
    _dbBrazilianCuisine = !_dbBrazilianCuisine!;
    notifyListeners();
  }

  // CaribbeanCuisine Data
  bool? get dbCaribbeanCuisine => _dbCaribbeanCuisine;
  set dbCaribbeanCuisine (bool? dbCaribbeanCuisine) {
    _dbCaribbeanCuisine = dbCaribbeanCuisine;
    notifyListeners();
  }

  toggleCaribbeanCuisine() {
    _dbCaribbeanCuisine = !_dbCaribbeanCuisine!;
    notifyListeners();
  }

  // ChineseCuisine Data
  bool? get dbChineseCuisine => _dbChineseCuisine;
  set dbChineseCuisine (bool? dbChineseCuisine) {
    _dbChineseCuisine = dbChineseCuisine;
    notifyListeners();
  }

  toggleChineseCuisine() {
    _dbChineseCuisine = !_dbChineseCuisine!;
    notifyListeners();
  }

  // FrenchCuisine Data
  bool? get dbFrenchCuisine => _dbFrenchCuisine;
  set dbFrenchCuisine (bool? dbFrenchCuisine) {
    _dbFrenchCuisine = dbFrenchCuisine;
    notifyListeners();
  }

  toggleFrenchCuisine() {
    _dbFrenchCuisine = !_dbFrenchCuisine!;
    notifyListeners();
  }

  // GreekCuisine Data
  bool? get dbGreekCuisine => _dbGreekCuisine;
  set dbGreekCuisine (bool? dbGreekCuisine) {
    _dbGreekCuisine = dbGreekCuisine;
    notifyListeners();
  }

  toggleGreekCuisine() {
    _dbGreekCuisine = !_dbGreekCuisine!;
    notifyListeners();
  }

  // IndianCuisine Data
  bool? get dbIndianCuisine => _dbIndianCuisine;
  set dbIndianCuisine (bool? dbIndianCuisine) {
    _dbIndianCuisine = dbIndianCuisine;
    notifyListeners();
  }

  toggleIndianCuisine() {
    _dbIndianCuisine = !_dbIndianCuisine!;
    notifyListeners();
  }

  // ItalianCuisine Data
  bool? get dbItalianCuisine => _dbItalianCuisine;
  set dbItalianCuisine (bool? dbItalianCuisine) {
    _dbItalianCuisine = dbItalianCuisine;
    notifyListeners();
  }

  toggleItalianCuisine() {
    _dbItalianCuisine = !_dbItalianCuisine!;
    notifyListeners();
  }

  // JapaneseCuisine Data
  bool? get dbJapaneseCuisine => _dbJapaneseCuisine;
  set dbJapaneseCuisine (bool? dbJapaneseCuisine) {
    _dbJapaneseCuisine = dbJapaneseCuisine;
    notifyListeners();
  }

  toggleJapaneseCuisine() {
    _dbJapaneseCuisine = !_dbJapaneseCuisine!;
    notifyListeners();
  }

  // MediterraneanCuisine Data
  bool? get dbMediterraneanCuisine => _dbMediterraneanCuisine;
  set dbMediterraneanCuisine (bool? dbMediterraneanCuisine) {
    _dbMediterraneanCuisine = dbMediterraneanCuisine;
    notifyListeners();
  }

  toggleMediterraneanCuisine() {
    _dbMediterraneanCuisine = !_dbMediterraneanCuisine!;
    notifyListeners();
  }

  // MexicanCuisine Data
  bool? get dbMexicanCuisine => _dbMexicanCuisine;
  set dbMexicanCuisine (bool? dbMexicanCuisine) {
    _dbMexicanCuisine = dbMexicanCuisine;
    notifyListeners();
  }

  toggleMexicanCuisine() {
    _dbMexicanCuisine = !_dbMexicanCuisine!;
    notifyListeners();
  }

  // ThaiCuisine Data
  bool? get dbThaiCuisine => _dbThaiCuisine;
  set dbThaiCuisine (bool? dbThaiCuisine) {
    _dbThaiCuisine = dbThaiCuisine;
    notifyListeners();
  }

  toggleThaiCuisine() {
    _dbThaiCuisine = !_dbThaiCuisine!;
    notifyListeners();
  }

  // SoulFoodCuisine Data
  bool? get dbSoulFoodCuisine => _dbSoulFoodCuisine;
  set dbSoulFoodCuisine (bool? dbSoulFoodCuisine) {
    _dbSoulFoodCuisine = dbSoulFoodCuisine;
    notifyListeners();
  }

  toggleSoulFoodCuisine() {
    _dbSoulFoodCuisine = !_dbSoulFoodCuisine!;
    notifyListeners();
  }

  // BrunchCuisine Data
  bool? get dbBrunchCuisine => _dbBrunchCuisine;
  set dbBrunchCuisine (bool? dbBrunchCuisine) {
    _dbBrunchCuisine = dbBrunchCuisine;
    notifyListeners();
  }

  toggleBrunchCuisine() {
    _dbBrunchCuisine = !_dbBrunchCuisine!;
    notifyListeners();
  }

  // BuffetCuisine Data
  bool? get dbBuffetCuisine => _dbBuffetCuisine;
  set dbBuffetCuisine (bool? dbBuffetCuisine) {
    _dbBuffetCuisine = dbBuffetCuisine;
    notifyListeners();
  }

  toggleBuffetCuisine() {
    _dbBuffetCuisine = !_dbBuffetCuisine!;
    notifyListeners();
  }

  // DessertsCuisine Data
  bool? get dbDessertsCuisine => _dbDessertsCuisine;
  set dbDessertsCuisine (bool? dbDessertsCuisine) {
    _dbDessertsCuisine = dbDessertsCuisine;
    notifyListeners();
  }

  toggleDessertsCuisine() {
    _dbDessertsCuisine = !_dbDessertsCuisine!;
    notifyListeners();
  }

  // SandwichesCuisine Data
  bool? get dbSandwichesCuisine => _dbSandwichesCuisine;
  set dbSandwichesCuisine (bool? dbSandwichesCuisine) {
    _dbSandwichesCuisine = dbSandwichesCuisine;
    notifyListeners();
  }

  toggleSandwichesCuisine() {
    _dbSandwichesCuisine = !_dbSandwichesCuisine!;
    notifyListeners();
  }

  // NoodlesCuisine Data
  bool? get dbNoodlesCuisine => _dbNoodlesCuisine;
  set dbNoodlesCuisine (bool? dbNoodlesCuisine) {
    _dbNoodlesCuisine = dbNoodlesCuisine;
    notifyListeners();
  }

  toggleNoodlesCuisine() {
    _dbNoodlesCuisine = !_dbNoodlesCuisine!;
    notifyListeners();
  }

  // SeafoodCuisine Data
  bool? get dbSeafoodCuisine => _dbSeafoodCuisine;
  set dbSeafoodCuisine (bool? dbSeafoodCuisine) {
    _dbSeafoodCuisine = dbSeafoodCuisine;
    notifyListeners();
  }

  toggleSeafoodCuisine() {
    _dbSeafoodCuisine = !_dbSeafoodCuisine!;
    notifyListeners();
  }

  // VietnameseCuisine Data
  bool? get dbVietnameseCuisine => _dbVietnameseCuisine;
  set dbVietnameseCuisine (bool? dbVietnameseCuisine) {
    _dbVietnameseCuisine = dbVietnameseCuisine;
    notifyListeners();
  }

  toggleVietnameseCuisine() {
    _dbVietnameseCuisine = !_dbVietnameseCuisine!;
    notifyListeners();
  }

  // TurkishCuisine Data
  bool? get dbTurkishCuisine => _dbTurkishCuisine;
  set dbTurkishCuisine (bool? dbTurkishCuisine) {
    _dbTurkishCuisine = dbTurkishCuisine;
    notifyListeners();
  }

  toggleTurkishCuisine() {
    _dbTurkishCuisine = !_dbTurkishCuisine!;
    notifyListeners();
  }

  // AnyCuisine Data
  bool? get dbAnyCuisine => _dbAnyCuisine;
  set dbAnyCuisine (bool? dbAnyCuisine) {
    _dbAnyCuisine = dbAnyCuisine;
    notifyListeners();
  }

  toggleAnyCuisine() {
    _dbAnyCuisine = !_dbAnyCuisine!;
    notifyListeners();
  }

  // NoContactPay Data
  bool? get dbNoContactPay => _dbNoContactPay;
  set dbNoContactPay (bool? dbNoContactPay) {
    _dbNoContactPay = dbNoContactPay;
    notifyListeners();
  }

  toggleNoContactPay() {
    _dbNoContactPay = !_dbNoContactPay!;
    notifyListeners();
  }

  // NoContactDelivery Data
  bool? get dbNoContactDelivery => _dbNoContactDelivery;
  set dbNoContactDelivery (bool? dbNoContactDelivery) {
    _dbNoContactDelivery = dbNoContactDelivery;
    notifyListeners();
  }

  toggleNoContactDelivery() {
    _dbNoContactDelivery = !_dbNoContactDelivery!;
    notifyListeners();
  }

  // StaffMasks Data
  bool? get dbStaffMasks => _dbStaffMasks;
  set dbStaffMasks (bool? dbStaffMasks) {
    _dbStaffMasks = dbStaffMasks;
    notifyListeners();
  }

  toggleStaffMasks() {
    _dbStaffMasks = !_dbStaffMasks!;
    notifyListeners();
  }

  // MasksReq Data
  bool? get dbMasksReq => _dbMasksReq;
  set dbMasksReq (bool? dbMasksReq) {
    _dbMasksReq = dbMasksReq;
    notifyListeners();
  }

  toggleMasksReq() {
    _dbMasksReq = !_dbMasksReq!;
    notifyListeners();
  }

  // StaffGloves Data
  bool? get dbStaffGloves => _dbStaffGloves;
  set dbStaffGloves (bool? dbStaffGloves) {
    _dbStaffGloves = dbStaffGloves;
    notifyListeners();
  }

  toggleStaffGloves() {
    _dbStaffGloves = !_dbStaffGloves!;
    notifyListeners();
  }

  // LimitCap Data
  bool? get dbLimitCap => _dbLimitCap;
  set dbLimitCap (bool? dbLimitCap) {
    _dbLimitCap = dbLimitCap;
    notifyListeners();
  }

  toggleLimitCap() {
    _dbLimitCap = !_dbLimitCap!;
    notifyListeners();
  }

  // SaniBetwCust Data
  bool? get dbSaniBetwCust => _dbSaniBetwCust;
  set dbSaniBetwCust (bool? dbSaniBetwCust) {
    _dbSaniBetwCust = dbSaniBetwCust;
    notifyListeners();
  }

  toggleSaniBetwCust() {
    _dbSaniBetwCust = !_dbSaniBetwCust!;
    notifyListeners();
  }

  // HandSaniGiven Data
  bool? get dbHandSaniGiven => _dbHandSaniGiven;
  set dbHandSaniGiven (bool? dbHandSaniGiven) {
    _dbHandSaniGiven = dbHandSaniGiven;
    notifyListeners();
  }

  toggleHandSaniGiven() {
    _dbHandSaniGiven = !_dbHandSaniGiven!;
    notifyListeners();
  }

  // AnyHealthCovid Data
  bool? get dbAnyHealthCovid => _dbAnyHealthCovid;
  set dbAnyHealthCovid (bool? dbAnyHealthCovid) {
    _dbAnyHealthCovid = dbAnyHealthCovid;
    notifyListeners();
  }

  toggleAnyHealthCovid() {
    _dbAnyHealthCovid = !_dbAnyHealthCovid!;
    notifyListeners();
  }

  // DiabeticDiet Data
  bool? get dbDiabeticDiet => _dbDiabeticDiet;
  set dbDiabeticDiet (bool? dbDiabeticDiet) {
    _dbDiabeticDiet = dbDiabeticDiet;
    notifyListeners();
  }

  toggleDiabeticDiet() {
    _dbDiabeticDiet = !_dbDiabeticDiet!;
    notifyListeners();
  }

  // FreshDiet Data
  bool? get dbFreshDiet => _dbFreshDiet;
  set dbFreshDiet (bool? dbFreshDiet) {
    _dbFreshDiet = dbFreshDiet;
    notifyListeners();
  }

  toggleFreshDiet() {
    _dbFreshDiet = !_dbFreshDiet!;
    notifyListeners();
  }

  // HalalDiet Data
  bool? get dbHalalDiet => _dbHalalDiet;
  set dbHalalDiet (bool? dbHalalDiet) {
    _dbHalalDiet = dbHalalDiet;
    notifyListeners();
  }

  toggleHalalDiet() {
    _dbHalalDiet = !_dbHalalDiet!;
    notifyListeners();
  }

  // HealthyNotVegetDiet Data
  bool? get dbHealthyNotVegetDiet => _dbHealthyNotVegetDiet;
  set dbHealthyNotVegetDiet (bool? dbHealthyNotVegetDiet) {
    _dbHealthyNotVegetDiet = dbHealthyNotVegetDiet;
    notifyListeners();
  }

  toggleHealthyNotVegetDiet() {
    _dbHealthyNotVegetDiet = !_dbHealthyNotVegetDiet!;
    notifyListeners();
  }

  // KosherDiet Data
  bool? get dbKosherDiet => _dbKosherDiet;
  set dbKosherDiet (bool? dbKosherDiet) {
    _dbKosherDiet = dbKosherDiet;
    notifyListeners();
  }

  toggleKosherDiet() {
    _dbKosherDiet = !_dbKosherDiet!;
    notifyListeners();
  }

  // PescatarianDiet Data
  bool? get dbPescatarianDiet => _dbPescatarianDiet;
  set dbPescatarianDiet (bool? dbPescatarianDiet) {
    _dbPescatarianDiet = dbPescatarianDiet;
    notifyListeners();
  }

  togglePescatarianDiet() {
    _dbPescatarianDiet = !_dbPescatarianDiet!;
    notifyListeners();
  }

  // VeganDiet Data
  bool? get dbVeganDiet => _dbVeganDiet;
  set dbVeganDiet (bool? dbVeganDiet) {
    _dbVeganDiet = dbVeganDiet;
    notifyListeners();
  }

  toggleVeganDiet() {
    _dbVeganDiet = !_dbVeganDiet!;
    notifyListeners();
  }

  // VegetarianDiet Data
  bool? get dbVegetarianDiet => _dbVegetarianDiet;
  set dbVegetarianDiet (bool? dbVegetarianDiet) {
    _dbVegetarianDiet = dbVegetarianDiet;
    notifyListeners();
  }

  toggleVegetarianDiet() {
    _dbVegetarianDiet = !_dbVegetarianDiet!;
    notifyListeners();
  }

  // AnyDiet Data
  bool? get dbAnyDiet => _dbAnyDiet;
  set dbAnyDiet (bool? dbAnyDiet) {
    _dbAnyDiet = dbAnyDiet;
    notifyListeners();
  }

  toggleAnyDiet() {
    _dbAnyDiet = !_dbAnyDiet!;
    notifyListeners();
  }

  // MatchDiet Data
  bool? get dbMatchDiet => _dbMatchDiet;
  set dbMatchDiet (bool? dbMatchDiet) {
    _dbMatchDiet = dbMatchDiet;
    notifyListeners();
  }

  toggleMatchDiet() {
    _dbMatchDiet = !_dbMatchDiet!;
    notifyListeners();
  }

  // MatchDensity Data
  bool? get dbMatchDensity => _dbMatchDensity;
  set dbMatchDensity (bool? dbMatchDensity) {
    _dbMatchDensity = dbMatchDensity;
    notifyListeners();
  }

  toggleMatchDensity() {
    _dbMatchDensity = !_dbMatchDensity!;
    notifyListeners();
  }

  // MatchCuisine Data
  bool? get dbMatchCuisine => _dbMatchCuisine;
  set dbMatchCuisine (bool? dbMatchCuisine) {
    _dbMatchCuisine = dbMatchCuisine;
    notifyListeners();
  }

  toggleMatchCuisine() {
    _dbMatchCuisine = !_dbMatchCuisine!;
    notifyListeners();
  }

  // GoodForCouples Data
  bool? get dbGoodForCouples => _dbGoodForCouples;
  set dbGoodForCouples (bool? dbGoodForCouples) {
    _dbGoodForCouples = dbGoodForCouples;
    notifyListeners();
  }

  toggleGoodForCouples() {
    _dbGoodForCouples = !_dbGoodForCouples!;
    notifyListeners();
  }

  // MatchPayment Data
  bool? get dbMatchPayment => _dbMatchPayment;
  set dbMatchPayment (bool? dbMatchPayment) {
    _dbMatchPayment = dbMatchPayment;
    notifyListeners();
  }

  toggleMatchPayment() {
    _dbMatchPayment = !_dbMatchPayment!;
    notifyListeners();
  }

  // ReqRSVP Data
  bool? get dbReqRSVP => _dbReqRSVP;
  set dbReqRSVP (bool? dbReqRSVP) {
    _dbReqRSVP = dbReqRSVP;
    notifyListeners();
  }

  toggleReqRSVP() {
    _dbReqRSVP = !_dbReqRSVP!;
    notifyListeners();
  }

  // Groups5Plus Data
  bool? get dbGroups5Plus => _dbGroups5Plus;
  set dbGroups5Plus (bool? dbGroups5Plus) {
    _dbGroups5Plus = dbGroups5Plus;
    notifyListeners();
  }

  toggleGroups5Plus() {
    _dbGroups5Plus = !_dbGroups5Plus!;
    notifyListeners();
  }

  // MatchBudget Data
  bool? get dbMatchBudget => _dbMatchBudget;
  set dbMatchBudget (bool? dbMatchBudget) {
    _dbMatchBudget = dbMatchBudget;
    notifyListeners();
  }

  toggleMatchBudget() {
    _dbMatchBudget = !_dbMatchBudget!;
    notifyListeners();
  }

  // WaitTime Data
  double? get dbWaitTime => _dbWaitTime;
  set dbWaitTime (double? dbWaitTime) {
    _dbWaitTime = dbWaitTime;
    notifyListeners();
  }

  changeWaitTime(double dbWaitTime) {
    _dbWaitTime = dbWaitTime;
    notifyListeners();
  }

  // LocallyOwned Data
  bool? get dbLocallyOwned => _dbLocallyOwned;
  set dbLocallyOwned (bool? dbLocallyOwned) {
    _dbLocallyOwned = dbLocallyOwned;
    notifyListeners();
  }

  toggleLocallyOwned() {
    _dbLocallyOwned = !_dbLocallyOwned!;
    notifyListeners();
  }

  // LocallySourced Data
  bool? get dbLocallySourced => _dbLocallySourced;
  set dbLocallySourced (bool? dbLocallySourced) {
    _dbLocallySourced = dbLocallySourced;
    notifyListeners();
  }

  toggleLocallySourced() {
    _dbLocallySourced = !_dbLocallySourced!;
    notifyListeners();
  }

  // AnyLocalSpot Data
  bool? get dbAllLocalSpot => _dbAllLocalSpot;
  set dbAllLocalSpot (bool? dbAllLocalSpot) {
    _dbAllLocalSpot = dbAllLocalSpot;
    notifyListeners();
  }

  toggleAnyLocalSpot() {
    _dbAllLocalSpot = !_dbAllLocalSpot!;
    notifyListeners();
  }

  // Specials Data
  bool? get dbSpecials => _dbSpecials;
  set dbSpecials (bool? dbSpecials) {
    _dbSpecials = dbSpecials;
    notifyListeners();
  }

  toggleSpecials() {
    _dbSpecials = !_dbSpecials!;
    notifyListeners();
  }

  // OutdoorSeating Data
  bool? get dbOutdoorSeating => _dbOutdoorSeating;
  set dbOutdoorSeating (bool? dbOutdoorSeating) {
    _dbOutdoorSeating = dbOutdoorSeating;
    notifyListeners();
  }

  toggleOutdoorSeating() {
    _dbOutdoorSeating = !_dbOutdoorSeating!;
    notifyListeners();
  }

  // Rooftop Data
  bool? get dbRooftop => _dbRooftop;
  set dbRooftop (bool? dbRooftop) {
    _dbRooftop = dbRooftop;
    notifyListeners();
  }

  toggleRooftop() {
    _dbRooftop = !_dbRooftop!;
    notifyListeners();
  }

  // CoverCharge Data
  bool? get dbCoverCharge => _dbCoverCharge;
  set dbCoverCharge (bool? dbCoverCharge) {
    _dbCoverCharge = dbCoverCharge;
    notifyListeners();
  }

  toggleCoverCharge() {
    _dbCoverCharge = !_dbCoverCharge!;
    notifyListeners();
  }

  // NoCoverCharge Data
  bool? get dbNoCoverCharge => _dbNoCoverCharge;
  set dbNoCoverCharge (bool? dbNoCoverCharge) {
    _dbNoCoverCharge = dbNoCoverCharge;
    notifyListeners();
  }

  toggleNoCoverCharge() {
    _dbNoCoverCharge = !_dbNoCoverCharge!;
    notifyListeners();
  }

  // Parking Data
  bool? get dbParking => _dbParking;
  set dbParking (bool? dbParking) {
    _dbParking = dbParking;
    notifyListeners();
  }

  toggleParking() {
    _dbParking = !_dbParking!;
    notifyListeners();
  }

  // LiveMusic Data
  bool? get dbLiveMusic => _dbLiveMusic;
  set dbLiveMusic (bool? dbLiveMusic) {
    _dbLiveMusic = dbLiveMusic;
    notifyListeners();
  }

  toggleLiveMusic() {
    _dbLiveMusic = !_dbLiveMusic!;
    notifyListeners();
  }

  // Games Data
  bool? get dbGames => _dbGames;
  set dbGames (bool? dbGames) {
    _dbGames = dbGames;
    notifyListeners();
  }

  toggleGames() {
    _dbGames = !_dbGames!;
    notifyListeners();
  }

  // Casual Data
  bool? get dbCasual => _dbCasual;
  set dbCasual (bool? dbCasual) {
    _dbCasual = dbCasual;
    notifyListeners();
  }

  toggleCasual() {
    _dbCasual = !_dbCasual!;
    notifyListeners();
  }

  // Accessibility Data
  bool? get dbAccessibility => _dbAccessibility;
  set dbAccessibility (bool? dbAccessibility) {
    _dbAccessibility = dbAccessibility;
    notifyListeners();
  }

  toggleAccessibility() {
    _dbAccessibility = !_dbAccessibility!;
    notifyListeners();
  }

  // Covid19Compliant Data
  bool? get dbCovid19Compliant => _dbCovid19Compliant;
  set dbCovid19Compliant (bool? dbCovid19Compliant) {
    _dbCovid19Compliant = dbCovid19Compliant;
    notifyListeners();
  }

  toggleCovid19Compliant() {
    _dbCovid19Compliant = !_dbCovid19Compliant!;
    notifyListeners();
  }

  // AnyLocalFeatures Data
  bool? get dbAnyLocalFeatures => _dbAnyLocalFeatures;
  set dbAnyLocalFeatures (bool? dbAnyLocalFeatures) {
    _dbAnyLocalFeatures = dbAnyLocalFeatures;
    notifyListeners();
  }

  toggleAnyLocalFeatures() {
    _dbAnyLocalFeatures = !_dbAnyLocalFeatures!;
    notifyListeners();
  }

  // Cash Data
  bool? get dbCash => _dbCash;
  set dbCash (bool? dbCash) {
    _dbCash = dbCash;
    notifyListeners();
  }

  toggleCash() {
    _dbCash = !_dbCash!;
    notifyListeners();
  }

  // CreditDebit Data
  bool? get dbCreditDebit => _dbCreditDebit;
  set dbCreditDebit (bool? dbCreditDebit) {
    _dbCreditDebit = dbCreditDebit;
    notifyListeners();
  }

  toggleCreditDebit() {
    _dbCreditDebit = !_dbCreditDebit!;
    notifyListeners();
  }

  // ApplePay Data
  bool? get dbApplePay => _dbApplePay;
  set dbApplePay (bool? dbApplePay) {
    _dbApplePay = dbApplePay;
    notifyListeners();
  }

  toggleApplePay() {
    _dbApplePay = !_dbApplePay!;
    notifyListeners();
  }

  // GooglePay Data
  bool? get dbGooglePay => _dbGooglePay;
  set dbGooglePay (bool? dbGooglePay) {
    _dbGooglePay = dbGooglePay;
    notifyListeners();
  }

  toggleGooglePay() {
    _dbGooglePay = !_dbGooglePay!;
    notifyListeners();
  }

  // PayPal Data
  bool? get dbPayPal => _dbPayPal;
  set dbPayPal (bool? dbPayPal) {
    _dbPayPal = dbPayPal;
    notifyListeners();
  }

  togglePayPal() {
    _dbPayPal = !_dbPayPal!;
    notifyListeners();
  }

  // CashApp Data
  bool? get dbCashApp => _dbCashApp;
  set dbCashApp (bool? dbCashApp) {
    _dbCashApp = dbCashApp;
    notifyListeners();
  }

  toggleCashApp() {
    _dbCashApp = !_dbCashApp!;
    notifyListeners();
  }

  // Venmo Data
  bool? get dbVenmo => _dbVenmo;
  set dbVenmo (bool? dbVenmo) {
    _dbVenmo = dbVenmo;
    notifyListeners();
  }

  toggleVenmo() {
    _dbVenmo = !_dbVenmo!;
    notifyListeners();
  }

  // Cryptocurrency Data
  bool? get dbCryptocurrency => _dbCryptocurrency;
  set dbCryptocurrency (bool? dbCryptocurrency) {
    _dbCryptocurrency = dbCryptocurrency;
    notifyListeners();
  }

  toggleCryptocurrency() {
    _dbCryptocurrency = !_dbCryptocurrency!;
    notifyListeners();
  }

  // AnyPayment Data
  bool? get dbAnyPayment => _dbAnyPayment;
  set dbAnyPayment (bool? dbAnyPayment) {
    _dbAnyPayment = dbAnyPayment;
    notifyListeners();
  }

  toggleAnyPayment() {
    _dbAnyPayment = !_dbAnyPayment!;
    notifyListeners();
  }

  // Single Data
  bool? get dbSingle => _dbSingle;
  set dbSingle (bool? dbSingle) {
    _dbSingle = dbSingle;
    notifyListeners();
  }

  toggleSingle() {
    _dbSingle = !_dbSingle!;
    notifyListeners();
  }

  // Married Data
  bool? get dbMarried => _dbMarried;
  set dbMarried (bool? dbMarried) {
    _dbMarried = dbMarried;
    notifyListeners();
  }

  toggleMarried() {
    _dbMarried = !_dbMarried!;
    notifyListeners();
  }

  // InARelationship Data
  bool? get dbInARelationship => _dbInARelationship;
  set dbInARelationship (bool? dbInARelationship) {
    _dbInARelationship = dbInARelationship;
    notifyListeners();
  }

  toggleInARelationship() {
    _dbInARelationship = !_dbInARelationship!;
    notifyListeners();
  }

  // AnyRelationship Data
  bool? get dbAnyRelationship => _dbAnyRelationship;
  set dbAnyRelationship (bool? dbAnyRelationship) {
    _dbAnyRelationship = dbAnyRelationship;
    notifyListeners();
  }

  toggleAnyRelationship() {
    _dbAnyRelationship = !_dbAnyRelationship!;
    notifyListeners();
  }

  // RadiusDistance Data
  double? get dbRadiusDistance => _dbRadiusDistance;
  set dbRadiusDistance (double? dbRadiusDistance) {
    _dbRadiusDistance = dbRadiusDistance;
    notifyListeners();
  }

  changeRadiusDistance(double dbRadiusDistance) {
    _dbRadiusDistance = dbRadiusDistance;
    notifyListeners();
  }

   // RadiusLocationDescription Data
   Place? get dbRadiusLocationDescription =>_dbRadiusLocationDescription;
   set dbRadiusLocationDescription (Place? dbRadiusLocationDescription) {
     _dbRadiusLocationDescription = dbRadiusLocationDescription;
     notifyListeners();
   }

   // RadiusLatLong Data
   Place? get dbRadiusLatLong =>_dbRadiusLatLong;
   set dbRadiusLatLong (Place? dbRadiusLatLong) {
     _dbRadiusLatLong = dbRadiusLatLong;
     notifyListeners();
   }

  // Intimate Data
  bool? get dbIntimate => _dbIntimate;
  set dbIntimate (bool? dbIntimate) {
    _dbIntimate = dbIntimate;
    notifyListeners();
  }

  toggleIntimate() {
    _dbIntimate = !_dbIntimate!;
    notifyListeners();
  }

  // AverageDensity Data
  bool? get dbAverageDensity => _dbAverageDensity;
  set dbAverageDensity (bool? dbAverageDensity) {
    _dbAverageDensity = dbAverageDensity;
    notifyListeners();
  }

  toggleAverageDensity() {
    _dbAverageDensity = !_dbAverageDensity!;
    notifyListeners();
  }

  // Comfy Data
  bool? get dbComfy => _dbComfy;
  set dbComfy (bool? dbComfy) {
    _dbComfy = dbComfy;
    notifyListeners();
  }

  toggleComfy() {
    _dbComfy = !_dbComfy!;
    notifyListeners();
  }

  // AboveAverageDensity Data
  bool? get dbAboveAverageDensity => _dbAboveAverageDensity;
  set dbAboveAverageDensity (bool? dbAboveAverageDensity) {
    _dbAboveAverageDensity = dbAboveAverageDensity;
    notifyListeners();
  }

  toggleAboveAverageDensity() {
    _dbAboveAverageDensity = !_dbAboveAverageDensity!;
    notifyListeners();
  }

  // PackedCrowds Data
  bool? get dbPackedCrowds => _dbPackedCrowds;
  set dbPackedCrowds (bool? dbPackedCrowds) {
    _dbPackedCrowds = dbPackedCrowds;
    notifyListeners();
  }

  togglePackedCrowds() {
    _dbPackedCrowds = !_dbPackedCrowds!;
    notifyListeners();
  }

  // AnyDensity Data
  bool? get dbAnyDensity => _dbAnyDensity;
  set dbAnyDensity (bool? dbAnyDensity) {
    _dbAnyDensity = dbAnyDensity;
    notifyListeners();
  }

  toggleAnyDensity() {
    _dbAnyDensity = !_dbAnyDensity!;
    notifyListeners();
  }

  // SocialDistance Data
  bool? get dbSocialDistance => _dbSocialDistance;
  set dbSocialDistance (bool? dbSocialDistance) {
    _dbSocialDistance = dbSocialDistance;
    notifyListeners();
  }

  toggleSocialDistance() {
    _dbSocialDistance = !_dbSocialDistance!;
    notifyListeners();
  }

  // Reset Amdient density data
  bool? get dbResetAmbiDensityValue => _dbResetAmbiDensityValue;
  set dbResetAmbiDensityValue (bool? dbResetAmbiDensityValue) {
    _dbResetAmbiDensityValue = dbResetAmbiDensityValue;
    notifyListeners();
  }

  toggleResetAmbiDensityValue(){
    _dbResetAmbiDensityValue = !_dbResetAmbiDensityValue!;
    notifyListeners();

  }

  // Reset Commute data
  bool? get dbResetCommuteValue => _dbResetCommuteValue;
  set dbResetCommuteValue(bool? dbResetCommuteValue) {
    _dbResetCommuteValue = dbResetCommuteValue;
    notifyListeners();
  }

  toggleResetCommuteValue(){
    _dbResetCommuteValue = !_dbResetCommuteValue!;
    notifyListeners();
  }

  //Reset relationship data
  bool? get dbResetRelatValue => _dbResetRelatValue;
  set dbResetRelatValue (bool? dbResetRelatValue) {
    _dbResetRelatValue = dbResetRelatValue;
    notifyListeners();
  }

  toggleResetRelatValue(){
   _dbResetRelatValue = !_dbResetRelatValue!;
    notifyListeners();
  }

  // Reset Cuisine Value data
  bool? get dbResetCuisineValue => _dbResetCuisineValue;
  set dbResetCuisineValue (bool? dbResetCuisineValue) {
  _dbResetCuisineValue = dbResetCuisineValue;
  notifyListeners();
  }


  toggleResetCuisineValue(){
    _dbResetCuisineValue = !_dbResetCuisineValue!;
    notifyListeners();
  }

  // Reset Diet Value data
  bool? get  dbResetDietValue => _dbResetDietValue;
  set dbResetDietValue (bool? dbResetDietValue) {
    _dbResetDietValue = dbResetDietValue;
    notifyListeners();
  }


  toggleResetDIetValue(){
    _dbResetDietValue = !_dbResetDietValue!;
    notifyListeners();
  }


// Reset LocalSpotValue
  bool? get  dbResetLocalSpotValue => _dbResetLocalSpotValue;
  set dbResetLocalSpotValue (bool? dbResetLocalSpotValue) {
    _dbResetLocalSpotValue = dbResetLocalSpotValue;
    notifyListeners();
  }


  toggleResetLocalSpotValue(){
    _dbResetLocalSpotValue = !_dbResetLocalSpotValue!;
    notifyListeners();
  }

  //Reset Healt and Covid value
  bool? get dbResetHealthCovidValue => _dbResetHealthCovidValue;
  set dbResetHealthCovidValue (bool? dbResetHealthCovidValue) {
    _dbResetHealthCovidValue = dbResetHealthCovidValue;
    notifyListeners();
  }

  toggleResetHealthCovidValue() {
    _dbResetHealthCovidValue = !_dbResetHealthCovidValue!;
    notifyListeners();
  }

  // Reset Location and Features data
  bool? get dbResetLocationFeaturesValue => _dbResetLocationFeaturesValue;
  set dbResetLocationFeaturesValue (bool? dbResetLocationFeaturesValue) {
    _dbResetLocationFeaturesValue = dbResetLocationFeaturesValue;
    notifyListeners();
  }

  toggleResetLocationFeaturesValue() {
    _dbResetLocationFeaturesValue = !_dbResetLocationFeaturesValue!;
    notifyListeners();
  }

  bool? get dbResetPaymentsValue => _dbResetPaymentsValue;
  set dbResetPaymentsValue (bool? dbResetPaymentsValue) {
    _dbResetPaymentsValue = dbResetPaymentsValue;
    notifyListeners();
  }

  toggleResetPaymentValue() {
    _dbResetHealthCovidValue = !_dbResetPaymentsValue!;
    notifyListeners();
  }


}
