import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class CryptocurrencyController extends BasePreferencesController {

void run(bool dbCryptocurrency) async {
preferenceUpdateService.updateCryptocurrency(dbCryptocurrency);
preferenceAnalyticsService.analyticsCryptocurrency(dbCryptocurrency);
}

}
