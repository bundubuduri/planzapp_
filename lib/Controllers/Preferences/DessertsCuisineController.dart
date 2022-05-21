import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class DessertsCuisineController extends BasePreferencesController {

void run(bool dbDessertsCuisine) async {
preferenceUpdateService.updateDessertsCuisine(dbDessertsCuisine);
preferenceAnalyticsService.analyticsDessertsCuisine(dbDessertsCuisine);
}

}
