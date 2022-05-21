import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class BarbequeCuisineController extends BasePreferencesController {

void run(bool dbBarbequeCuisine) async {
preferenceUpdateService.updateBarbequeCuisine(dbBarbequeCuisine);
preferenceAnalyticsService.analyticsBarbequeCuisine(dbBarbequeCuisine);
}

}
