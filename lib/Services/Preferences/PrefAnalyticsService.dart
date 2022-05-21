
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planzapp/Views/Plans/MapSuggestionsScreen.dart';
import 'package:planzapp/Controllers/Utility/GetUserController.dart';

class PreferenceAnalyticsService{

  void analyticsRideShare(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'RideShare',parameters:{'Value':newValue});
  }

  void analyticsBudget(double newValue) async {
    FirebaseAnalytics().logEvent(name: 'Budget',parameters:{'Value':newValue});
  }

  void analyticsAboveBudgetPercent(double newValue) async {

    FirebaseAnalytics().logEvent(name: 'AboveBudgetPercent',parameters:{'Value':newValue});
  }

  void analyticsBelowBudgetPercent(double newValue) async {
    FirebaseAnalytics().logEvent(name: 'BelowBudgetPercent',parameters:{'Value':newValue});
  }

  void analyticsNotifyPriceInc(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'NotifyPriceInc',parameters:{'Value':newValue});
  }

  void analyticsNotifyPriceDec(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'NotifyPriceDec',parameters:{'Value':newValue});
  }

  void analyticsStickToBudget(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'StickToBudget',parameters:{'Value':newValue});
  }

  void analyticsOutOfBudget(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'OutOfBudget',parameters:{'Value':newValue});
  }

  void analyticsEnableBelowBudget(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'EnableBelowBudget',parameters:{'Value':newValue});
  }

  void analyticsEnableAboveBudget(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'EnableAboveBudget',parameters:{'Value':newValue});
  }

  void analyticsMultiplePlans(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'MultiplePlans',parameters:{'Value':newValue});
  }

  void analyticsDrive(bool newValue) async {
    await FirebaseAnalytics().logEvent(name: 'Drive',parameters:{'Value':newValue});
  }

  void analyticsFlight(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'Flight',parameters:{'Value':newValue});
  }

  void analyticsTrain(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'Train',parameters:{'Value':newValue});
  }

  void analyticsPublicBusMetro(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'PublicBusMetro',parameters:{'Value':newValue});
  }

  void analyticsWalk(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'Walk',parameters:{'Value':newValue});
  }

  void analyticsAnyCommute(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'AnyCommute',parameters:{'Value':newValue});
  }

  void analyticsAfricanCuisine(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'AfricanCuisine',parameters:{'Value':newValue});
  }

  void analyticsAmericanCuisine(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'AmericanCuisine',parameters:{'Value':newValue});
  }

  void analyticsBarbequeCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'BarbequeCuisine',parameters:{'Value':newValue});
  }

  void analyticsBrazilianCuisine(bool newValue) async {
 FirebaseAnalytics().logEvent(name: 'BrazilianCuisine',parameters:{'Value':newValue});
  }

  void analyticsCaribbeanCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'CaribbeanCuisine',parameters:{'Value':newValue});
  }

  void analyticsChineseCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'ChineseCuisine',parameters:{'Value':newValue});
  }

  void analyticsFrenchCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'FrenchCuisine',parameters:{'Value':newValue});
  }

  void analyticsGreekCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'GreekCuisine',parameters:{'Value':newValue});
  }

  void analyticsIndianCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'IndianCuisine',parameters:{'Value':newValue});
  }

  void analyticsItalianCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'ItalianCuisine',parameters:{'Value':newValue});
  }

  void analyticsJapaneseCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'JapaneseCuisine',parameters:{'Value':newValue});
  }

  void analyticsMediterraneanCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'MediterraneanCuisine',parameters:{'Value':newValue});
  }

  void analyticsMexicanCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'MexicanCuisine',parameters:{'Value':newValue});
  }

  void analyticsThaiCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'ThaiCuisine',parameters:{'Value':newValue});
  }

  void analyticsSoulFoodCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'SoulFoodCuisine',parameters:{'Value':newValue});
  }

  void analyticsBrunchCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'BrunchCuisine',parameters:{'Value':newValue});
  }

  void analyticsBuffetCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'BuffetCuisine',parameters:{'Value':newValue});
  }

  void analyticsDessertsCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'DessertsCuisine',parameters:{'Value':newValue});
  }

  void analyticsSandwichesCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'SandwichesCuisine',parameters:{'Value':newValue});
  }

  void analyticsNoodlesCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'NoodlesCuisine',parameters:{'Value':newValue});
  }

  void analyticsSeafoodCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'SeafoodCuisine',parameters:{'Value':newValue});
  }

  void analyticsVietnameseCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'VietnameseCuisine',parameters:{'Value':newValue});
  }

  void analyticsTurkishCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'TurkishCuisine',parameters:{'Value':newValue});
  }

  void analyticsAnyCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'AnyCuisine',parameters:{'Value':newValue});
  }

  void analyticsNoContactPay(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'NoContactPay',parameters:{'Value':newValue});
  }

  void analyticsNoContactDelivery(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'NoContactDelivery',parameters:{'Value':newValue});
  }

  void analyticsStaffMasks(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'StaffMasks',parameters:{'Value':newValue});
  }

  void analyticsMasksReq(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'MasksReq',parameters:{'Value':newValue});
  }

  void analyticsStaffGloves(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'StaffGloves',parameters:{'Value':newValue});
  }

  void analyticsLimitCap(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'LimitCap',parameters:{'Value':newValue});
  }

  void analyticsSaniBetwCust(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'SaniBetwCust',parameters:{'Value':newValue});
  }

  void analyticsHandSaniGiven(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'HandSaniGiven',parameters:{'Value':newValue});
  }

  void analyticsAnyHealthCovid(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'AnyHealthCovid',parameters:{'Value':newValue});
  }

  void analyticsDiabeticDiet(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'DiabeticDiet',parameters:{'Value':newValue});
  }

  void analyticsFreshDiet(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'FreshDiet',parameters:{'Value':newValue});
  }

  void analyticsHalalDiet(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'HalalDiet',parameters:{'Value':newValue});
  }

  void analyticsHealthyNotVegetDiet(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'HealthyNotVegetDiet',parameters:{'Value':newValue});
  }

  void analyticsKosherDiet(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'KosherDiet',parameters:{'Value':newValue});
  }

  void analyticsPescatarianDiet(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'PescatarianDiet',parameters:{'Value':newValue});
  }

  void analyticsVeganDiet(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'VeganDiet',parameters:{'Value':newValue});
  }

  void analyticsVegetarianDiet(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'VegetarianDiet',parameters:{'Value':newValue});
  }

  void analyticsAnyDiet(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'AnyDiet',parameters:{'Value':newValue});
  }

  void analyticsMatchDiet(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'MatchDiet',parameters:{'Value':newValue});
  }

  void analyticsMatchDensity(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'MatchDensity',parameters:{'Value':newValue});
  }

  void analyticsMatchCuisine(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'MatchCuisine',parameters:{'Value':newValue});
  }

  void analyticsGoodForCouples(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'GoodForCouples',parameters:{'Value':newValue});
  }

  void analyticsMatchPayment(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'MatchPayment',parameters:{'Value':newValue});
  }

  void analyticsReqRSVP(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'ReqRSVP',parameters:{'Value':newValue});
  }

  void analyticsGroups5Plus(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'Groups5Plus',parameters:{'Value':newValue});
  }

  void analyticsMatchBudget(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'MatchBudget',parameters:{'Value':newValue});
  }

  void analyticsWaitTime(double newValue) async {
   FirebaseAnalytics().logEvent(name: 'WaitTime',parameters:{'Value':newValue});
  }

  void analyticsLocallyOwned(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'LocallyOwned',parameters:{'Value':newValue});
  }

  void analyticsLocallySourced(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'LocallySourced',parameters:{'Value':newValue});
  }

  void analyticsAnyLocalSpot(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'AnyLocalSpot',parameters:{'Value':newValue});
  }

  void analyticsSpecials(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'Specials',parameters:{'Value':newValue});
  }

  void analyticsOutdoorSeating(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'OutdoorSeating',parameters:{'Value':newValue});
  }

  void analyticsRooftop(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'Rooftop',parameters:{'Value':newValue});
  }

  void analyticsCoverCharge(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'CoverCharge',parameters:{'Value':newValue});
  }

  void analyticsNoCoverCharge(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'NoCoverCharge',parameters:{'Value':newValue});
  }

  void analyticsParking(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'Parking',parameters:{'Value':newValue});
  }

  void analyticsLiveMusic(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'LiveMusic',parameters:{'Value':newValue});
  }

  void analyticsGames(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'Games',parameters:{'Value':newValue});
  }

  void analyticsCasual(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'Casual',parameters:{'Value':newValue});
  }

  void analyticsAccessibility(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'Accessibility',parameters:{'Value':newValue});
  }

  void analyticsCovid19Compliant(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'Covid19Compliant',parameters:{'Value':newValue});
  }

  void analyticsAnyLocalFeatures(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'AnyLocalFeatures',parameters:{'Value':newValue});
  }

  void analyticsCash(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'Cash',parameters:{'Value':newValue});
  }

  void analyticsCreditDebit(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'CreditDebit',parameters:{'Value':newValue});
  }

  void analyticsApplePay(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'ApplePay',parameters:{'Value':newValue});
  }

  void analyticsGooglePay(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'GooglePay',parameters:{'Value':newValue});
  }

  void analyticsPayPal(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'PayPal',parameters:{'Value':newValue});
  }

  void analyticsCashApp(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'CashApp',parameters:{'Value':newValue});
  }

  void analyticsVenmo(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'Venmo',parameters:{'Value':newValue});
  }

  void analyticsCryptocurrency(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'Cryptocurrency',parameters:{'Value':newValue});
  }

  void analyticsAnyPayment(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'AnyPayment',parameters:{'Value':newValue});
  }

  void analyticsSingle(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'Single',parameters:{'Value':newValue});
  }

  void analyticsMarried(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'Married',parameters:{'Value':newValue});
  }

  void analyticsInARelationship(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'InARelationship',parameters:{'Value':newValue});
  }

  void analyticsAnyRelationship(bool newValue) async {
    FirebaseAnalytics().logEvent(name: 'AnyRelationship',parameters:{'Value':newValue});
  }

  void analyticsRadiusDistance(double newValue) async {
   FirebaseAnalytics().logEvent(name: 'RadiusDistance',parameters:{'Value':newValue});
  }

  void analyticsIntimate(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'Intimate',parameters:{'Value':newValue});
  }

  void analyticsAverageDensity(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'AverageDensity',parameters:{'Value':newValue});
  }

  void analyticsComfy(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'Comfy',parameters:{'Value':newValue});
  }

  void analyticsAboveAverageDensity(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'AboveAverageDensity',parameters:{'Value':newValue});
  }

  void analyticsPackedCrowds(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'PackedCrowds',parameters:{'Value':newValue});
  }

  void analyticsAnyDensity(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'AnyDensity',parameters:{'Value':newValue});
  }

  void analyticsSocialDistance(bool newValue) async {
   FirebaseAnalytics().logEvent(name: 'SocialDistance',parameters:{'Value':newValue});
  }


  void analyticsRadiusLocation(Place place) async {
   final geolocation = await place.geolocation;
    FirebaseAnalytics().logEvent(name: 'RadiusLocationLatLong',parameters:{'Value':geolocation.coordinates.toString()});
    FirebaseAnalytics().logEvent(name: 'RadiusLocationDescription',parameters:{'Value':place.description});
  }
}
