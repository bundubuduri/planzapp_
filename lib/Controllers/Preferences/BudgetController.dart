import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class BudgetController extends BasePreferencesController {

void run(double dbBudget) async {
preferenceUpdateService.updateBudget(dbBudget);
preferenceAnalyticsService.analyticsBudget(dbBudget);
}

}
