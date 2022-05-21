import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class MarriedController extends BasePreferencesController {

void run(bool dbMarried) async {
preferenceUpdateService.updateMarried(dbMarried);
preferenceAnalyticsService.analyticsMarried(dbMarried);
}

}
