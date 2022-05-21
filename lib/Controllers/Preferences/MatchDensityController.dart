import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class MatchDensityController extends BasePreferencesController {

void run(bool dbMatchDensity) async {
preferenceUpdateService.updateMatchDensity(dbMatchDensity);
preferenceAnalyticsService.analyticsMatchDensity(dbMatchDensity);
}

}
