import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class NotifyPriceIncController extends BasePreferencesController {

void run(bool dbNotifyPriceInc) async {
preferenceUpdateService.updateNotifyPriceInc(dbNotifyPriceInc);
preferenceAnalyticsService.analyticsNotifyPriceInc(dbNotifyPriceInc);
}

}
