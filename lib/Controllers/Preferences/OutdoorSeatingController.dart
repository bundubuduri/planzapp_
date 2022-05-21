import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class OutdoorSeatingController extends BasePreferencesController {

void run(bool dbOutdoorSeating) async {
preferenceUpdateService.updateOutdoorSeating(dbOutdoorSeating);
preferenceAnalyticsService.analyticsOutdoorSeating(dbOutdoorSeating);
}

}