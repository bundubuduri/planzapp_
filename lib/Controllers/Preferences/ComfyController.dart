import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class ComfyController extends BasePreferencesController {

void run(bool dbComfy) async {
preferenceUpdateService.updateComfy(dbComfy);
preferenceAnalyticsService.analyticsComfy(dbComfy);
}

}
