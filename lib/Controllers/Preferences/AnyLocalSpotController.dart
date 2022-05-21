import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AnyLocalSpotController extends BasePreferencesController {

  void run(bool dbAnyLocalSpot) async {
    preferenceUpdateService.updateAnyLocalSpot(dbAnyLocalSpot);
    preferenceAnalyticsService.analyticsAnyLocalSpot(dbAnyLocalSpot);
  }

}
