import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class CreditDebitController extends BasePreferencesController {

void run(bool dbCreditDebit) async {
preferenceUpdateService.updateCreditDebit(dbCreditDebit);
preferenceAnalyticsService.analyticsCreditDebit(dbCreditDebit);
}

}
