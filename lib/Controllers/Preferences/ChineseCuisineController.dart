import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class ChineseCuisineController extends BasePreferencesController {

void run(bool dbChineseCuisine) async {
preferenceUpdateService.updateChineseCuisine(dbChineseCuisine);
preferenceAnalyticsService.analyticsChineseCuisine(dbChineseCuisine);
}

}
