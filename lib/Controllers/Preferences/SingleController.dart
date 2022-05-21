import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class SingleController extends BasePreferencesController {

void run(bool dbSingle) async {
preferenceUpdateService.updateSingle(dbSingle);
preferenceAnalyticsService.analyticsSingle(dbSingle);
}

}
