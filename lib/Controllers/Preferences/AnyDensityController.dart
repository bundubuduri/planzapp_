import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AnyDensityController extends BasePreferencesController {

void run(bool dbAnyDensity) async {
preferenceUpdateService.updateAnyDensity(dbAnyDensity);
preferenceAnalyticsService.analyticsAnyDensity(dbAnyDensity);
}

}
