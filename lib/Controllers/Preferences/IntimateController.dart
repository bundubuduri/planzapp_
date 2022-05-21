import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class IntimateController extends BasePreferencesController {

void run(bool dbIntimate) async {
preferenceUpdateService.updateIntimate(dbIntimate);
preferenceAnalyticsService.analyticsIntimate(dbIntimate);
}

}
