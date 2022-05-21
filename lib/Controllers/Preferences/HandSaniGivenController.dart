
import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class HandSaniGivenController extends BasePreferencesController {

void run(bool dbHandSaniGiven) async {
 preferenceUpdateService.updateHandSaniGiven(dbHandSaniGiven);
preferenceAnalyticsService.analyticsHandSaniGiven(dbHandSaniGiven);
}

}