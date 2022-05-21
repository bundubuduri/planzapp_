import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class MultiplePlansController extends BasePreferencesController {

void run(bool dbMultiplePlans) async {
preferenceUpdateService.updateMultiplePlans(dbMultiplePlans);
preferenceAnalyticsService.analyticsMultiplePlans(dbMultiplePlans);
}

}
