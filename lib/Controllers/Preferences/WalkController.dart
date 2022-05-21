import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class WalkController extends BasePreferencesController {

void run(bool dbWalk) async {
preferenceUpdateService.updateWalk(dbWalk);
preferenceAnalyticsService.analyticsWalk(dbWalk);
}

}
