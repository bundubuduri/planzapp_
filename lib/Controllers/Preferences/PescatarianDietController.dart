import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class PescatarianDietController extends BasePreferencesController {

void run(bool dbPescatarianDiet) async {
preferenceUpdateService.updatePescatarianDiet(dbPescatarianDiet);
preferenceAnalyticsService.analyticsPescatarianDiet(dbPescatarianDiet);
}

}
