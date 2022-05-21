import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class Groups5PlusController extends BasePreferencesController {

void run(bool dbGroups5Plus) async {
 preferenceUpdateService.updateGroups5Plus(dbGroups5Plus);
 preferenceAnalyticsService.analyticsGroups5Plus(dbGroups5Plus);
}

}