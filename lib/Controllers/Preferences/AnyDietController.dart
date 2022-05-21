import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AnyDietController extends BasePreferencesController {

void run(bool dbAnyDiet) async {
preferenceUpdateService.updateAnyDiet(dbAnyDiet);
preferenceAnalyticsService.analyticsAnyDiet(dbAnyDiet);
}

}
