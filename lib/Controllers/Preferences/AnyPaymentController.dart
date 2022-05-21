import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AnyPaymentController extends BasePreferencesController {

  void run(bool dbAnyPayment) async {
    preferenceUpdateService.updateAnyPayment(dbAnyPayment);
    preferenceAnalyticsService.analyticsAnyPayment(dbAnyPayment);
  }

}
