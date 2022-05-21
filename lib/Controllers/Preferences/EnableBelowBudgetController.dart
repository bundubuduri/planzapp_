import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class EnableBelowBudgetController extends BasePreferencesController {

void run(bool dbEnableBelowBudget) async {
 preferenceUpdateService.updateEnableBelowBudget(dbEnableBelowBudget);
 preferenceAnalyticsService.analyticsEnableBelowBudget(dbEnableBelowBudget);
}

}