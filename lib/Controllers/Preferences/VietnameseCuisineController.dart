import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class VietnameseCuisineController extends BasePreferencesController {

  void run(bool dbVietnameseCuisine) async {
preferenceUpdateService.updateVietnameseCuisine(dbVietnameseCuisine);
preferenceAnalyticsService.analyticsVietnameseCuisine(dbVietnameseCuisine);
  }

}
