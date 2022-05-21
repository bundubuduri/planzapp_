import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class LiveMusicController extends BasePreferencesController {

void run(bool dbLiveMusic) async {
preferenceUpdateService.updateLiveMusic(dbLiveMusic);
preferenceAnalyticsService.analyticsLiveMusic(dbLiveMusic);
}

}
