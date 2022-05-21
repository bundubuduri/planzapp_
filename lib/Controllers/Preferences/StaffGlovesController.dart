import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class StaffGlovesController extends BasePreferencesController {

void run(bool dbStaffGloves) async {
preferenceUpdateService.updateStaffGloves(dbStaffGloves);
preferenceAnalyticsService.analyticsStaffGloves(dbStaffGloves);
}

}
