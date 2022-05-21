import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class OutOfBudgetController extends BasePreferencesController {

void run(bool dbOutOfBudget) async {
preferenceUpdateService.updateOutOfBudget(dbOutOfBudget);
preferenceAnalyticsService.analyticsOutOfBudget(dbOutOfBudget);
}

}
