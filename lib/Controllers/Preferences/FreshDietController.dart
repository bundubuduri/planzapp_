import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class FreshDietController extends BasePreferencesController {

void run(bool dbFreshDiet) async {
 preferenceUpdateService.updateFreshDiet(dbFreshDiet);
 preferenceAnalyticsService.analyticsFreshDiet(dbFreshDiet);
}

}