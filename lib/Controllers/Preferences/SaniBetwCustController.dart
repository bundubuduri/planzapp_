import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class SaniBetwCustController extends BasePreferencesController {

void run(bool dbSaniBetwCust) async {
preferenceUpdateService.updateSaniBetwCust(dbSaniBetwCust);
preferenceAnalyticsService.analyticsSaniBetwCust(dbSaniBetwCust);
}

}
