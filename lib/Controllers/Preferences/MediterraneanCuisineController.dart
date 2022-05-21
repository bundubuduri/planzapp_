import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class MediterraneanCuisineController extends BasePreferencesController {

void run(bool dbMediterraneanCuisine) async {
preferenceUpdateService.updateMediterraneanCuisine(dbMediterraneanCuisine);
preferenceAnalyticsService.analyticsMediterraneanCuisine(dbMediterraneanCuisine);
}

}
