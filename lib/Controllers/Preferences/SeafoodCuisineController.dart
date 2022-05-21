import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class SeafoodCuisineController extends BasePreferencesController {

void run(bool dbSeafoodCuisine) async {
preferenceUpdateService.updateSeafoodCuisine(dbSeafoodCuisine);
preferenceAnalyticsService.analyticsSeafoodCuisine(dbSeafoodCuisine);
}

}
