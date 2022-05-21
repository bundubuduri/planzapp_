import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class TrainController extends BasePreferencesController {

void run(bool dbTrain) async {
preferenceUpdateService.updateTrain(dbTrain);
preferenceAnalyticsService.analyticsTrain(dbTrain);
}

}
