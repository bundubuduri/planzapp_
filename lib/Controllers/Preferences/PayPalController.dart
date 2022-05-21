import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class PayPalController extends BasePreferencesController {

void run(bool dbPayPal) async {
preferenceUpdateService.updatePayPal(dbPayPal);
preferenceAnalyticsService.analyticsPayPal(dbPayPal);
}

}
