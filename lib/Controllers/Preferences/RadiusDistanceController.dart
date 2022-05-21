import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class RadiusDistanceController extends BasePreferencesController {

void run(double distance) async {
preferenceUpdateService.updateRadiusDistance(distance);
preferenceAnalyticsService.analyticsRadiusDistance(distance);
}

}
