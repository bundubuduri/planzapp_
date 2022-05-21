import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class LocallySourcedController extends BasePreferencesController {

void run(bool dbLocallySourced) async {
preferenceUpdateService.updateLocallySourced(dbLocallySourced);
preferenceAnalyticsService.analyticsLocallySourced(dbLocallySourced);
}

}
