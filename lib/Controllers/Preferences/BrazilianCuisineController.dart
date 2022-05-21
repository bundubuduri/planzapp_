import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class BrazilianCuisineController extends BasePreferencesController {

void run(bool dbBrazilianCuisine) async {
preferenceUpdateService.updateBrazilianCuisine(dbBrazilianCuisine);
preferenceAnalyticsService.analyticsBrazilianCuisine(dbBrazilianCuisine);
}

}
