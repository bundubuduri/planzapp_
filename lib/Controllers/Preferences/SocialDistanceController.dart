import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class SocialDistanceController extends BasePreferencesController {

void run(bool dbSocialDistance) async {
preferenceUpdateService.updateSocialDistance(dbSocialDistance);
preferenceAnalyticsService.analyticsSocialDistance(dbSocialDistance);
}

}
