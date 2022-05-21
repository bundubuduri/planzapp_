import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class GreekCuisineController extends BasePreferencesController {

void run(bool dbGreekCuisine) async {
 preferenceUpdateService.updateGreekCuisine(dbGreekCuisine);
 preferenceAnalyticsService.analyticsGreekCuisine(dbGreekCuisine);
}

}