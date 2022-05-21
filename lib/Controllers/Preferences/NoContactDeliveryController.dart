import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class NoContactDeliveryController extends BasePreferencesController {

void run(bool dbNoContactDelivery) async {
preferenceUpdateService.updateNoContactDelivery(dbNoContactDelivery);
preferenceAnalyticsService.analyticsNoContactDelivery(dbNoContactDelivery);
}

}
