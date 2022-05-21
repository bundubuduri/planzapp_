import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AmericanCuisineController extends BasePreferencesController {

void run(bool dbAmericanCuisine) async {
preferenceUpdateService.updateAmericanCuisine(dbAmericanCuisine);
preferenceAnalyticsService.analyticsAmericanCuisine(dbAmericanCuisine);

}

}
