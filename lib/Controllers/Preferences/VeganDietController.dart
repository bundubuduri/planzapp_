import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class VeganDietController extends BasePreferencesController {

void run(bool dbVeganDiet) async {
preferenceUpdateService.updateVeganDiet(dbVeganDiet);
preferenceAnalyticsService.analyticsVeganDiet(dbVeganDiet);
}

}
