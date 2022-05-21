import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class EnableAboveBudgetController extends BasePreferencesController {

void run(bool dbEnableAboveBudget) async {
 preferenceUpdateService.updateEnableAboveBudget(dbEnableAboveBudget);
 preferenceAnalyticsService.analyticsEnableAboveBudget(dbEnableAboveBudget);
}

}