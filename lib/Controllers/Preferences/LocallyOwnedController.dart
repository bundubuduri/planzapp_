import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class LocallyOwnedController extends BasePreferencesController {

void run(bool dbLocallyOwned) async {
preferenceUpdateService.updateLocallyOwned(dbLocallyOwned);
preferenceAnalyticsService.analyticsLocallyOwned(dbLocallyOwned);
}

}
