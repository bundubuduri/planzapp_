import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class VegetarianDietController extends BasePreferencesController {

void run(bool dbVegetarianDiet) async {
preferenceUpdateService.updateVegetarianDiet(dbVegetarianDiet);
preferenceAnalyticsService.analyticsVegetarianDiet(dbVegetarianDiet);
}

}
