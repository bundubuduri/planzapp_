import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class GoodForCouplesController extends BasePreferencesController {

void run(bool dbGoodForCouples) async {
 preferenceUpdateService.updateGoodForCouples(dbGoodForCouples);
 preferenceAnalyticsService.analyticsGoodForCouples(dbGoodForCouples);
}

}