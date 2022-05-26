
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:search_map_place/search_map_place.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planzapp/Views/Plans/MapSuggestionsScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';

class PreferenceAnalyticsService{

  void analyticsRideShare(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'RideShare',parameters:{'Value':newValue});
  }

  void analyticsBudget(double newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Budget',parameters:{'Value':newValue});
  }

  void analyticsAboveBudgetPercent(double newValue) async {

    FirebaseAnalytics.instance.logEvent(name: 'AboveBudgetPercent',parameters:{'Value':newValue});
  }

  void analyticsBelowBudgetPercent(double newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'BelowBudgetPercent',parameters:{'Value':newValue});
  }

  void analyticsNotifyPriceInc(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'NotifyPriceInc',parameters:{'Value':newValue});
  }

  void analyticsNotifyPriceDec(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'NotifyPriceDec',parameters:{'Value':newValue});
  }

  void analyticsStickToBudget(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'StickToBudget',parameters:{'Value':newValue});
  }

  void analyticsOutOfBudget(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'OutOfBudget',parameters:{'Value':newValue});
  }

  void analyticsEnableBelowBudget(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'EnableBelowBudget',parameters:{'Value':newValue});
  }

  void analyticsEnableAboveBudget(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'EnableAboveBudget',parameters:{'Value':newValue});
  }

  void analyticsMultiplePlans(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'MultiplePlans',parameters:{'Value':newValue});
  }

  void analyticsDrive(bool newValue) async {
    await FirebaseAnalytics.instance.logEvent(name: 'Drive',parameters:{'Value':newValue});
  }

  void analyticsFlight(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Flight',parameters:{'Value':newValue});
  }

  void analyticsTrain(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Train',parameters:{'Value':newValue});
  }

  void analyticsPublicBusMetro(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'PublicBusMetro',parameters:{'Value':newValue});
  }

  void analyticsWalk(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Walk',parameters:{'Value':newValue});
  }

  void analyticsAnyCommute(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'AnyCommute',parameters:{'Value':newValue});
  }

  void analyticsAfricanCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'AfricanCuisine',parameters:{'Value':newValue});
  }

  void analyticsAmericanCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'AmericanCuisine',parameters:{'Value':newValue});
  }

  void analyticsBarbequeCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'BarbequeCuisine',parameters:{'Value':newValue});
  }

  void analyticsBrazilianCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'BrazilianCuisine',parameters:{'Value':newValue});
  }

  void analyticsCaribbeanCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'CaribbeanCuisine',parameters:{'Value':newValue});
  }

  void analyticsChineseCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'ChineseCuisine',parameters:{'Value':newValue});
  }

  void analyticsFrenchCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'FrenchCuisine',parameters:{'Value':newValue});
  }

  void analyticsGreekCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'GreekCuisine',parameters:{'Value':newValue});
  }

  void analyticsIndianCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'IndianCuisine',parameters:{'Value':newValue});
  }

  void analyticsItalianCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'ItalianCuisine',parameters:{'Value':newValue});
  }

  void analyticsJapaneseCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'JapaneseCuisine',parameters:{'Value':newValue});
  }

  void analyticsMediterraneanCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'MediterraneanCuisine',parameters:{'Value':newValue});
  }

  void analyticsMexicanCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'MexicanCuisine',parameters:{'Value':newValue});
  }

  void analyticsThaiCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'ThaiCuisine',parameters:{'Value':newValue});
  }

  void analyticsSoulFoodCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'SoulFoodCuisine',parameters:{'Value':newValue});
  }

  void analyticsBrunchCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'BrunchCuisine',parameters:{'Value':newValue});
  }

  void analyticsBuffetCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'BuffetCuisine',parameters:{'Value':newValue});
  }

  void analyticsDessertsCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'DessertsCuisine',parameters:{'Value':newValue});
  }

  void analyticsSandwichesCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'SandwichesCuisine',parameters:{'Value':newValue});
  }

  void analyticsNoodlesCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'NoodlesCuisine',parameters:{'Value':newValue});
  }

  void analyticsSeafoodCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'SeafoodCuisine',parameters:{'Value':newValue});
  }

  void analyticsVietnameseCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'VietnameseCuisine',parameters:{'Value':newValue});
  }

  void analyticsTurkishCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'TurkishCuisine',parameters:{'Value':newValue});
  }

  void analyticsAnyCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'AnyCuisine',parameters:{'Value':newValue});
  }

  void analyticsNoContactPay(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'NoContactPay',parameters:{'Value':newValue});
  }

  void analyticsNoContactDelivery(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'NoContactDelivery',parameters:{'Value':newValue});
  }

  void analyticsStaffMasks(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'StaffMasks',parameters:{'Value':newValue});
  }

  void analyticsMasksReq(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'MasksReq',parameters:{'Value':newValue});
  }

  void analyticsStaffGloves(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'StaffGloves',parameters:{'Value':newValue});
  }

  void analyticsLimitCap(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'LimitCap',parameters:{'Value':newValue});
  }

  void analyticsSaniBetwCust(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'SaniBetwCust',parameters:{'Value':newValue});
  }

  void analyticsHandSaniGiven(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'HandSaniGiven',parameters:{'Value':newValue});
  }

  void analyticsAnyHealthCovid(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'AnyHealthCovid',parameters:{'Value':newValue});
  }

  void analyticsDiabeticDiet(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'DiabeticDiet',parameters:{'Value':newValue});
  }

  void analyticsFreshDiet(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'FreshDiet',parameters:{'Value':newValue});
  }

  void analyticsHalalDiet(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'HalalDiet',parameters:{'Value':newValue});
  }

  void analyticsHealthyNotVegetDiet(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'HealthyNotVegetDiet',parameters:{'Value':newValue});
  }

  void analyticsKosherDiet(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'KosherDiet',parameters:{'Value':newValue});
  }

  void analyticsPescatarianDiet(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'PescatarianDiet',parameters:{'Value':newValue});
  }

  void analyticsVeganDiet(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'VeganDiet',parameters:{'Value':newValue});
  }

  void analyticsVegetarianDiet(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'VegetarianDiet',parameters:{'Value':newValue});
  }

  void analyticsAnyDiet(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'AnyDiet',parameters:{'Value':newValue});
  }

  void analyticsMatchDiet(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'MatchDiet',parameters:{'Value':newValue});
  }

  void analyticsMatchDensity(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'MatchDensity',parameters:{'Value':newValue});
  }

  void analyticsMatchCuisine(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'MatchCuisine',parameters:{'Value':newValue});
  }

  void analyticsGoodForCouples(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'GoodForCouples',parameters:{'Value':newValue});
  }

  void analyticsMatchPayment(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'MatchPayment',parameters:{'Value':newValue});
  }

  void analyticsReqRSVP(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'ReqRSVP',parameters:{'Value':newValue});
  }

  void analyticsGroups5Plus(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Groups5Plus',parameters:{'Value':newValue});
  }

  void analyticsMatchBudget(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'MatchBudget',parameters:{'Value':newValue});
  }

  void analyticsWaitTime(double newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'WaitTime',parameters:{'Value':newValue});
  }

  void analyticsLocallyOwned(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'LocallyOwned',parameters:{'Value':newValue});
  }

  void analyticsLocallySourced(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'LocallySourced',parameters:{'Value':newValue});
  }

  void analyticsAnyLocalSpot(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'AnyLocalSpot',parameters:{'Value':newValue});
  }

  void analyticsSpecials(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Specials',parameters:{'Value':newValue});
  }

  void analyticsOutdoorSeating(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'OutdoorSeating',parameters:{'Value':newValue});
  }

  void analyticsRooftop(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Rooftop',parameters:{'Value':newValue});
  }

  void analyticsCoverCharge(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'CoverCharge',parameters:{'Value':newValue});
  }

  void analyticsNoCoverCharge(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'NoCoverCharge',parameters:{'Value':newValue});
  }

  void analyticsParking(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Parking',parameters:{'Value':newValue});
  }

  void analyticsLiveMusic(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'LiveMusic',parameters:{'Value':newValue});
  }

  void analyticsGames(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Games',parameters:{'Value':newValue});
  }

  void analyticsCasual(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Casual',parameters:{'Value':newValue});
  }

  void analyticsAccessibility(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Accessibility',parameters:{'Value':newValue});
  }

  void analyticsCovid19Compliant(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Covid19Compliant',parameters:{'Value':newValue});
  }

  void analyticsAnyLocalFeatures(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'AnyLocalFeatures',parameters:{'Value':newValue});
  }

  void analyticsCash(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Cash',parameters:{'Value':newValue});
  }

  void analyticsCreditDebit(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'CreditDebit',parameters:{'Value':newValue});
  }

  void analyticsApplePay(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'ApplePay',parameters:{'Value':newValue});
  }

  void analyticsGooglePay(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'GooglePay',parameters:{'Value':newValue});
  }

  void analyticsPayPal(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'PayPal',parameters:{'Value':newValue});
  }

  void analyticsCashApp(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'CashApp',parameters:{'Value':newValue});
  }

  void analyticsVenmo(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Venmo',parameters:{'Value':newValue});
  }

  void analyticsCryptocurrency(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Cryptocurrency',parameters:{'Value':newValue});
  }

  void analyticsAnyPayment(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'AnyPayment',parameters:{'Value':newValue});
  }

  void analyticsSingle(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Single',parameters:{'Value':newValue});
  }

  void analyticsMarried(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Married',parameters:{'Value':newValue});
  }

  void analyticsInARelationship(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'InARelationship',parameters:{'Value':newValue});
  }

  void analyticsAnyRelationship(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'AnyRelationship',parameters:{'Value':newValue});
  }

  void analyticsRadiusDistance(double newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'RadiusDistance',parameters:{'Value':newValue});
  }

  void analyticsIntimate(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Intimate',parameters:{'Value':newValue});
  }

  void analyticsAverageDensity(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'AverageDensity',parameters:{'Value':newValue});
  }

  void analyticsComfy(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'Comfy',parameters:{'Value':newValue});
  }

  void analyticsAboveAverageDensity(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'AboveAverageDensity',parameters:{'Value':newValue});
  }

  void analyticsPackedCrowds(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'PackedCrowds',parameters:{'Value':newValue});
  }

  void analyticsAnyDensity(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'AnyDensity',parameters:{'Value':newValue});
  }

  void analyticsSocialDistance(bool newValue) async {
    FirebaseAnalytics.instance.logEvent(name: 'SocialDistance',parameters:{'Value':newValue});
  }


  void analyticsRadiusLocation(Place place) async {
   final geolocation = await place.geolocation;
   FirebaseAnalytics.instance.logEvent(name: 'RadiusLocationLatLong',parameters:{'Value':geolocation.coordinates.toString()});
   FirebaseAnalytics.instance.logEvent(name: 'RadiusLocationDescription',parameters:{'Value':place.description});
  }
}
