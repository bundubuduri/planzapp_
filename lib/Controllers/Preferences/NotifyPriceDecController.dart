import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class NotifyPriceDecController extends BasePreferencesController {

void run(bool dbNotifyPriceDec) async {
preferenceUpdateService.updateNotifyPriceDec(dbNotifyPriceDec);
preferenceAnalyticsService.analyticsNotifyPriceDec(dbNotifyPriceDec);
}

}
