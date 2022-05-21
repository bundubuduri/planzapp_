import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class DriveController extends BasePreferencesController {

void run(bool dbDrive) async {
 preferenceUpdateService.updateDrive(dbDrive);
 preferenceAnalyticsService.analyticsDrive(dbDrive);
}

}