import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class HealthyNotVegetDietController extends BasePreferencesController {

void run(bool dbHealthyNotVegetDiet) async {
 preferenceUpdateService.updateHealthyNotVegetDiet(dbHealthyNotVegetDiet);
 preferenceAnalyticsService.analyticsHealthyNotVegetDiet(dbHealthyNotVegetDiet);
}

}
