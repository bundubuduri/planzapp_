import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class StickToBudgetController extends BasePreferencesController {

void run(bool dbStickToBudget) async {
preferenceUpdateService.updateStickToBudget(dbStickToBudget);
preferenceAnalyticsService.analyticsStickToBudget(dbStickToBudget);
}

}
