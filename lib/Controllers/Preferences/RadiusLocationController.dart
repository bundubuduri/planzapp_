import 'package:planzapp/Controllers/Preferences/BasePreferencesController.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planzapp/Views/Plans/MapSuggestionsScreen.dart';

class RadiusLocationController extends BasePreferencesController {

void run(Place place) async {
preferenceUpdateService.updateRadiusLocation(place);
preferenceAnalyticsService.analyticsRadiusLocation(place);
}

}
