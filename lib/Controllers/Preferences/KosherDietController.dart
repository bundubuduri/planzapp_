import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class KosherDietController extends BasePreferencesController {

void run(bool dbKosherDiet) async {
preferenceUpdateService.updateKosherDiet(dbKosherDiet);
preferenceAnalyticsService.analyticsKosherDiet(dbKosherDiet);
}

}
