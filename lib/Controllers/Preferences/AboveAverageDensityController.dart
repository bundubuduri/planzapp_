import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AboveAverageDensityController extends BasePreferencesController {

void run(bool dbAboveAverageDensity) async {
 preferenceUpdateService.updateAboveAverageDensity(dbAboveAverageDensity);
preferenceAnalyticsService.analyticsAboveAverageDensity(dbAboveAverageDensity);

}

}
