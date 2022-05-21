import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AnyCuisineController extends BasePreferencesController {

void run(bool dbAnyCuisine) async {
preferenceUpdateService.updateAnyCuisine(dbAnyCuisine);
preferenceAnalyticsService.analyticsAnyCuisine(dbAnyCuisine);
}

}
