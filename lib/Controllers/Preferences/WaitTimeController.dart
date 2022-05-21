import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class WaitTimeController extends BasePreferencesController {

void run(double dbWaitTime) async {
preferenceUpdateService.updateWaitTime(dbWaitTime);
preferenceAnalyticsService.analyticsWaitTime(dbWaitTime);
}

}
