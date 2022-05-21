import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class PublicBusMetroController extends BasePreferencesController {

void run(bool dbPublicBusMetro) async {
preferenceUpdateService.updatePublicBusMetro(dbPublicBusMetro);
preferenceAnalyticsService.analyticsPublicBusMetro(dbPublicBusMetro);
}

}
