import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class ThaiCuisineController extends BasePreferencesController {

void run(bool dbThaiCuisine) async {
preferenceUpdateService.updateThaiCuisine(dbThaiCuisine);
preferenceAnalyticsService.analyticsThaiCuisine(dbThaiCuisine);
}

}
