import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class CoverChargeController extends BasePreferencesController {

void run(bool dbCoverCharge) async {
preferenceUpdateService.updateCoverCharge(dbCoverCharge);
preferenceAnalyticsService.analyticsCoverCharge(dbCoverCharge);
}

}
