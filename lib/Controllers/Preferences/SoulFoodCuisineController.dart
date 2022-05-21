import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class SoulFoodCuisineController extends BasePreferencesController {

void run(bool dbSoulFoodCuisine) async {
preferenceUpdateService.updateSoulFoodCuisine(dbSoulFoodCuisine);
preferenceAnalyticsService.analyticsSoulFoodCuisine(dbSoulFoodCuisine);
}

}
