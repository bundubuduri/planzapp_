import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';

class Covid19CompliantController extends BasePreferencesController {

void run(bool dbCovid19Compliant) async {
preferenceUpdateService.updateCovid19Compliant(dbCovid19Compliant);
preferenceAnalyticsService.analyticsCovid19Compliant(dbCovid19Compliant);
}

}
