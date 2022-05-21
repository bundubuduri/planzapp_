import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class SandwichesCuisineController extends BasePreferencesController {

void run(bool dbSandwichesCuisine) async {
preferenceUpdateService.updateSandwichesCuisine(dbSandwichesCuisine);
preferenceAnalyticsService.analyticsSandwichesCuisine(dbSandwichesCuisine);
}

}
