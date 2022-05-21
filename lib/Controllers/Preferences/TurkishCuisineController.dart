import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class TurkishCuisineController extends BasePreferencesController {

void run(bool dbTurkishCuisine) async {
preferenceUpdateService.updateTurkishCuisine(dbTurkishCuisine);
preferenceAnalyticsService.analyticsTurkishCuisine(dbTurkishCuisine);
}

}
