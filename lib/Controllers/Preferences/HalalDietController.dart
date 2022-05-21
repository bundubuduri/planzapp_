import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class HalalDietController extends BasePreferencesController {

void run(bool dbHalalDiet) async {
 preferenceUpdateService.updateHalalDiet(dbHalalDiet);
 preferenceAnalyticsService.analyticsHalalDiet(dbHalalDiet);
}

}