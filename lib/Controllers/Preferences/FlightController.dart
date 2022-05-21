import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class FlightController extends BasePreferencesController {

void run(bool dbFlight) async {
 preferenceUpdateService.updateFlight(dbFlight);
 preferenceAnalyticsService.analyticsFlight(dbFlight);
}

}