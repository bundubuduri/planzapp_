import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class MatchBudgetController extends BasePreferencesController {

void run(bool dbMatchBudget) async {
preferenceUpdateService.updateMatchBudget(dbMatchBudget);
preferenceAnalyticsService.analyticsMatchBudget(dbMatchBudget);
}

}
