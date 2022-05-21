import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class BuffetCuisineController extends BasePreferencesController {

void run(bool dbBuffetCuisine) async {
preferenceUpdateService.updateBuffetCuisine(dbBuffetCuisine);
preferenceAnalyticsService.analyticsBuffetCuisine(dbBuffetCuisine);
}

}
