import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class MasksReqController extends BasePreferencesController {

void run(bool dbMasksReq) async {
preferenceUpdateService.updateMasksReq(dbMasksReq);
preferenceAnalyticsService.analyticsMasksReq(dbMasksReq);
}

}
