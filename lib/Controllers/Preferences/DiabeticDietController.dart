import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class DiabeticDietController extends BasePreferencesController {

void run(bool dbDiabeticDiet) async {
preferenceUpdateService.updateDiabeticDiet(dbDiabeticDiet);
preferenceAnalyticsService.analyticsDiabeticDiet(dbDiabeticDiet);
}

}
