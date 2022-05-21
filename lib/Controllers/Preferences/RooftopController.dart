import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class RooftopController extends BasePreferencesController {

void run(bool dbRooftop) async {
preferenceUpdateService.updateRooftop(dbRooftop);
preferenceAnalyticsService.analyticsRooftop(dbRooftop);
}

}
