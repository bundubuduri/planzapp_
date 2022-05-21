import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class LimitCapController extends BasePreferencesController {

void run(bool dbLimitCap) async {
preferenceUpdateService.updateLimitCap(dbLimitCap);
preferenceAnalyticsService.analyticsLimitCap(dbLimitCap);
}

}
