import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AboveBudgetPercentController extends BasePreferencesController {

void run(double dbAboveBudgetPercent) async {
preferenceUpdateService.updateAboveBudgetPercent(dbAboveBudgetPercent);
 preferenceAnalyticsService.analyticsAboveBudgetPercent(dbAboveBudgetPercent);

}

}
