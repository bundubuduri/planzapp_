import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class CaribbeanCuisineController extends BasePreferencesController {

void run(bool dbCaribbeanCuisine) async {
preferenceUpdateService.updateCaribbeanCuisine(dbCaribbeanCuisine);
preferenceAnalyticsService.analyticsCaribbeanCuisine(dbCaribbeanCuisine);
}

}
