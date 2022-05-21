import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class IndianCuisineController extends BasePreferencesController {

void run(bool dbIndianCuisine) async {
 preferenceUpdateService.updateIndianCuisine(dbIndianCuisine);
 preferenceAnalyticsService.analyticsIndianCuisine(dbIndianCuisine);
}

}
