import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class GamesController extends BasePreferencesController {

void run(bool dbGames) async {
 preferenceUpdateService.updateGames(dbGames);
 preferenceAnalyticsService.analyticsGames(dbGames);
}

}