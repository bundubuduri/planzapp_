import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class NoCoverChargeController extends BasePreferencesController {

void run(bool dbNoCoverCharge) async {
preferenceUpdateService.updateNoCoverCharge(dbNoCoverCharge);
preferenceAnalyticsService.analyticsNoCoverCharge(dbNoCoverCharge);
}

}
