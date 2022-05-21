import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class ReqRSVPController extends BasePreferencesController {

void run(bool dbReqRSVP) async {
preferenceUpdateService.updateReqRSVP(dbReqRSVP);
preferenceAnalyticsService.analyticsReqRSVP(dbReqRSVP);
}

}
