import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class MatchDietController extends BasePreferencesController {

void run(bool dbMatchDiet) async {
preferenceUpdateService.updateMatchDiet(dbMatchDiet);
preferenceAnalyticsService.analyticsMatchDiet(dbMatchDiet);
}

}
