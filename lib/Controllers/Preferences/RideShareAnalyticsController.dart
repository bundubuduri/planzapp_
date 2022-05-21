import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class RideShareController extends BasePreferencesController {


  void run(bool dbRideShare) async {
preferenceAnalyticsService.analyticsRideShare(dbRideShare);
  }

} 
