import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class PackedCrowdsController extends BasePreferencesController {

void run(bool dbPackedCrowds) async {
 preferenceUpdateService.updatePackedCrowds(dbPackedCrowds);
 preferenceAnalyticsService.analyticsPackedCrowds(dbPackedCrowds);

}

}