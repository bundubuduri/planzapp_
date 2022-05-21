import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class MatchPaymentController extends BasePreferencesController {

void run(bool dbMatchPayment) async {
preferenceUpdateService.updateMatchPayment(dbMatchPayment);
preferenceAnalyticsService.analyticsMatchPayment(dbMatchPayment);
}

}
