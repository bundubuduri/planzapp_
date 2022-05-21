import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AverageDensityController extends BasePreferencesController {

void run(bool dbAverageDensity) async {
preferenceUpdateService.updateAverageDensity(dbAverageDensity);
preferenceAnalyticsService.analyticsAverageDensity(dbAverageDensity);
}

}
