import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class RideShareController extends BasePreferencesController {


  void run(bool dbRideShare) async {
preferenceUpdateService.updateRideShare(dbRideShare);
preferenceAnalyticsService.analyticsRideShare(dbRideShare);
  }

} 
