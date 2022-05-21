import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class VenmoController extends BasePreferencesController {

void run(bool dbVenmo) async {
preferenceUpdateService.updateVenmo(dbVenmo);
}

}
