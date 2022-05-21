import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AfricanCuisineController extends BasePreferencesController {

void run(bool dbAfricanCuisine) async {
preferenceUpdateService.updateAfricanCuisine(dbAfricanCuisine);
preferenceAnalyticsService.analyticsAfricanCuisine(dbAfricanCuisine);

}

}
