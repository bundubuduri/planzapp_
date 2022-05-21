import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AccessibilityController extends BasePreferencesController {

void run(bool dbAccessibility) async {
 preferenceUpdateService.updateAccessibility(dbAccessibility);
preferenceAnalyticsService.analyticsAccessibility(dbAccessibility);

}

}
