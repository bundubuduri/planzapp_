import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class JapaneseCuisineController extends BasePreferencesController {

void run(bool dbJapaneseCuisine) async {
preferenceUpdateService.updateJapaneseCuisine(dbJapaneseCuisine);
preferenceAnalyticsService.analyticsJapaneseCuisine(dbJapaneseCuisine);
}

}
