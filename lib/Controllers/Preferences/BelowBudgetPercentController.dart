import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class BelowBudgetPercentController extends BasePreferencesController {

void run(double dbBelowBudgetPercent) async {
preferenceUpdateService.updateBelowBudgetPercent(dbBelowBudgetPercent);
preferenceAnalyticsService.analyticsBelowBudgetPercent(dbBelowBudgetPercent);
}

}
