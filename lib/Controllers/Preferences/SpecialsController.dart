import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class SpecialsController extends BasePreferencesController {

void run(bool dbSpecials) async {
preferenceUpdateService.updateSpecials(dbSpecials);
preferenceAnalyticsService.analyticsSpecials(dbSpecials);
}

}
