import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class ItalianCuisineController extends BasePreferencesController {

void run(bool dbItalianCuisine) async {
preferenceUpdateService.updateItalianCuisine(dbItalianCuisine);
preferenceAnalyticsService.analyticsItalianCuisine(dbItalianCuisine);
}

}
