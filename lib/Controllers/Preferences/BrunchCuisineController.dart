import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class BrunchCuisineController extends BasePreferencesController {

void run(bool dbBrunchCuisine) async {
preferenceUpdateService.updateBrunchCuisine(dbBrunchCuisine);
preferenceAnalyticsService.analyticsBrunchCuisine(dbBrunchCuisine);
}

}
