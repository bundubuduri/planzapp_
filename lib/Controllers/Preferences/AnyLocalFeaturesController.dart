import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AnyLocalFeaturesController extends BasePreferencesController {

  void run(bool dbAnyLocalFeatures) async {
    preferenceUpdateService.updateAnyLocalFeatures(dbAnyLocalFeatures);
    preferenceAnalyticsService.analyticsAnyLocalFeatures(dbAnyLocalFeatures);
  }

}
