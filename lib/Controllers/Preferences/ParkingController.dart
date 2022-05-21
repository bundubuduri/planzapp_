import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class ParkingController extends BasePreferencesController {

void run(bool dbParking) async {
preferenceUpdateService.updateParking(dbParking);
preferenceAnalyticsService.analyticsParking(dbParking);
}

}