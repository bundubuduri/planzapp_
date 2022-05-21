import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class AnyRelationshipController extends BasePreferencesController {

  void run(bool dbAnyRelationship) async {
    preferenceUpdateService.updateAnyRelationship(dbAnyRelationship);
    preferenceAnalyticsService.analyticsAnyRelationship(dbAnyRelationship);
  }

}
