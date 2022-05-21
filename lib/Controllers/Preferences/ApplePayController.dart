import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class ApplePayController extends BasePreferencesController {

void run(bool dbApplePay) async {
preferenceUpdateService.updateApplePay(dbApplePay);
preferenceAnalyticsService.analyticsApplePay(dbApplePay);
}

}
