import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class FrenchCuisineController extends BasePreferencesController {

void run(bool dbFrenchCuisine) async {
 preferenceUpdateService.updateFrenchCuisine(dbFrenchCuisine);
 preferenceAnalyticsService.analyticsFrenchCuisine(dbFrenchCuisine);

}

}