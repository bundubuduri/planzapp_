import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class NoContactPayController extends BasePreferencesController {

void run(bool dbNoContactPay) async {
preferenceUpdateService.updateNoContactPay(dbNoContactPay);
preferenceAnalyticsService.analyticsNoContactPay(dbNoContactPay);
}

}
