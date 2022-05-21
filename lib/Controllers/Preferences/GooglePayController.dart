import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class GooglePayController extends BasePreferencesController {

void run(bool dbGooglePay) async {
 preferenceUpdateService.updateGooglePay(dbGooglePay);
 preferenceAnalyticsService.analyticsGooglePay(dbGooglePay);
}

}