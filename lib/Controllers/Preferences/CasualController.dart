import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class CasualController extends BasePreferencesController {

void run(bool dbCasual) async {
preferenceUpdateService.updateCasual(dbCasual);
preferenceAnalyticsService.analyticsCasual(dbCasual);
}

}
