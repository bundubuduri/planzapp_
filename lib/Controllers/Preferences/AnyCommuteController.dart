import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AnyCommuteController extends BasePreferencesController {

  void run(bool dbAnyCommute) async {
    preferenceUpdateService.updateAnyCommute(dbAnyCommute);
    preferenceAnalyticsService.analyticsAnyCommute(dbAnyCommute);
  }

}
