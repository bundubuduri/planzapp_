import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class StaffMasksController extends BasePreferencesController {

void run(bool dbStaffMasks) async {
preferenceUpdateService.updateStaffMasks(dbStaffMasks);
preferenceAnalyticsService.analyticsStaffMasks(dbStaffMasks);
}

}
