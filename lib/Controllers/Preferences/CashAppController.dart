import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class CashAppController extends BasePreferencesController {

void run(bool dbCashApp) async {
preferenceUpdateService.updateCashApp(dbCashApp);
preferenceAnalyticsService.analyticsCashApp(dbCashApp);
}

}
