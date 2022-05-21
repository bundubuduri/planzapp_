import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class NoodlesCuisineController extends BasePreferencesController {

void run(bool dbNoodlesCuisine) async {
preferenceUpdateService.updateNoodlesCuisine(dbNoodlesCuisine);
preferenceAnalyticsService.analyticsNoodlesCuisine(dbNoodlesCuisine);
}

}
