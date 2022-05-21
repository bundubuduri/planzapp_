import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AnyHealthCovidController extends BasePreferencesController {

  void run(bool dbAnyHealthCovid) async {
    preferenceUpdateService.updateAnyHealthCovid(dbAnyHealthCovid);
    preferenceAnalyticsService.analyticsAnyHealthCovid(dbAnyHealthCovid);
  }

}
