import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class InARelationshipController extends BasePreferencesController {

void run(bool dbInARelationship) async {
preferenceUpdateService.updateInARelationship(dbInARelationship);
preferenceAnalyticsService.analyticsInARelationship(dbInARelationship);
}

}
