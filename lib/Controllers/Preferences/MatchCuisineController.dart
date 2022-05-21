import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class MatchCuisineController extends BasePreferencesController {

void run(bool dbMatchCuisine) async {
preferenceUpdateService.updateMatchCuisine(dbMatchCuisine);
preferenceAnalyticsService.analyticsMatchCuisine(dbMatchCuisine);
}

}
