import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class CashController extends BasePreferencesController {

void run(bool dbCash) async {
preferenceUpdateService.updateCash(dbCash);
preferenceAnalyticsService.analyticsCash(dbCash);
}

}
