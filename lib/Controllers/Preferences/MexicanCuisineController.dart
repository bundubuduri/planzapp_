import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class MexicanCuisineController extends BasePreferencesController {

void run(bool dbMexicanCuisine) async {
preferenceUpdateService.updateMexicanCuisine(dbMexicanCuisine);
preferenceAnalyticsService.analyticsMexicanCuisine(dbMexicanCuisine);
}

}
