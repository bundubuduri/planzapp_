import 'dart:async';

import 'package:dotenv/dotenv.dart' show load, env;
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as requests;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:io';
import 'package:pretty_json/pretty_json.dart';
import 'categories.dart';

void main() async {
  var spot = Spot("44.921383, -93.264708");
  var results = await spot.search();
  print(results);
}

class Spot extends Endpoint {
  // connect the object to the apis
  final places =
      GoogleMapsPlaces(apiKey: "AIzaSyA1raSrtTQbDS_URBmS9d2uRVIHweC7qic");
  final geocoding =
      GoogleMapsGeocoding(apiKey: "AIzaSyA1raSrtTQbDS_URBmS9d2uRVIHweC7qic");

  // saves all of the places a user searches for
  final recentPlaces = [];

  dynamic initialLocation;

  //constructors
  Spot(this.initialLocation) : super();
  Spot.noLocation() : super();

  // this function takes in a string query for a real place and returns the coordinates
  Future<Map> placeToCoordinates(String place) async {
    // get the response from the api

    Location coordinates = await places
        .searchByText(place)
        .then((value) => value.results[0].geometry!.location);

    // add to the list of recently seen places
    recentPlaces.add(place);

    var lat = coordinates.lat;
    var lng = coordinates.lng;

    Map location = {'lat': lat, 'lng': lng};

    // return the coordinates
    // print("Coordinates ${location}");
    return location;
  }

  Future<String> coordinatesToPlace(Map coordinates) {
    // convert the coordinates into a geometry object
    Future<PlacesSearchResponse> p =
        places.searchByText('${coordinates["lat"]},${coordinates["lng"]}');

    var address = p.then((value) => value.results[0].formattedAddress!);
    return address;
  }

  Future<Map?> search(
      {dynamic location,
      num radius = 10,
      num limit = 25,
      String? query,
      String? category,
      bool verbose = false}) async {
    // handles for if no location is provided at all
    if (location == null && initialLocation == null) {
      throw Exception(
          '''This Method is not available because the users location was not provided.\nYou can also initialize the object with the .noLocation() constructor to use the methods [similar, details, next venues, reviews].''');
    }

    // handles for converting to location into the correct format for the search endpoint
    var coordinates = await _locationConversion(location);

    bool validCategory = await isCategoryId(category);

    // handles for the category options either returns a categoryid, null, or throws an error
    String? cat = validCategory ? category : await _handleCategory(category);

    // use the coordinates to do a search
    var results = await searchEndpoint(coordinates,
        radius: radius as int?,
        limit: limit as int?,
        query: query,
        category: cat,
        verbose: verbose);
    // return the results
    return results;
  }

  Future<Map?> recommend(
      {dynamic location,
      num? radius,
      String? query,
      int? limit,
      String? category,
      bool verbose = false}) async {
    // handles for if no location is provided at all
    if (location == null && initialLocation == null) {
      throw Exception(
          '''This Method is not available because the users location was not provided.\nYou can also initialize the object with the .noLocation() constructor to use the methods [similar, details, next venues, reviews].''');
    }

    // handle for arguments
    var coordinates = await _locationConversion(location);

    // handles for the category options either returns a categoryid, null, or throws an error
    bool validCategory = await isCategoryId(category);
    String? cat = validCategory ? category : await _handleCategory(category);
    // call the endpoint
    var results = await recommendEndpoint(coordinates,
        radius: radius,
        query: query,
        category: cat,
        limit: limit,
        verbose: verbose);
    // return results
    return results;
  }

  Future<Map?> similar({var coordinates, var venueId}) async {
    // returns venues similar to the place
    // the parameter place can either be a venueID, place coordinates, or a place string
    var results = await similarEndpoint(coordinates: coordinates, id: venueId);
    return results;
  }

  Future reviews(
      {var coordinates,
      var venueId,
      int? limit,
      bool filter: true,
      bool verbose: false}) async {
    var results = await reviewsEndpoint(
        coordinates: coordinates, id: venueId, limit: limit, verbose: verbose);

    if (filter) {
      var tips = results['response']['tips']['items'];
      List reviews = [];

      tips.forEach((tip) {
        var info = {
          'review_id': tip['id'],
          'timestamp':
              DateTime.fromMillisecondsSinceEpoch(tip['createdAt'] * 1000)
                  .toString(),
          'review': tip['text']
        };

        reviews.add(info);
      });

      return reviews;
    }

    return results;
  }

  Future<Map?> details({var coordinates, var venueId, bool? filter}) async {
    var results = await detailsEndpoint(coordinates: coordinates, id: venueId);
    if (filter == true) {
      // will hold the categories the venue falls under
      List cats = [];
      results!['response']['venue']['categories']
          .forEach((category) => cats.add(category['name']));

      var tips =
          await reviews(coordinates: coordinates, venueId: venueId, limit: 10);

      // holds the filtered data
      Map filtered = {
        'venue_id': results['response']['venue']['id'],
        'name': results['response']['venue']['name'],
        'number': results['response']['venue']['contact']['formattedPhone'],
        'address': results['response']['venue']['location']['address'],
        'categories': cats,
        'website': results['response']['venue']['url'],
        'rating': results['response']['venue']['rating'],
        'description': results['response']['venue']['description'],
        'closes': results['response']['venue']['hours']['status'],
        'reviews': tips,
        'attributes': _getAttributes(results['response']['venue']['attributes'])
      };

      return filtered;
    }
    return results;
  }

  List _getAttributes(Map attributes) {
    List newAttributes = [];

    // get the groups
    var groups = attributes['groups'];
    // for each group
    groups.forEach((group) {
      newAttributes.add({'type': group['type'], 'items': group['items']});
    });

    return newAttributes;
  }

  Future<Map?> nextVenues({var coordinates, var venueId}) async {
    var results =
        await nextVenuesEndpoint(coordinates: coordinates, id: venueId);
    return results;
  }

  Future<Map?> trending(
      {dynamic location,
      int? radius,
      String? query,
      int? limit,
      String? category,
      bool verbose = false}) async {
    // handles for if no location is provided at all
    if (location == null && initialLocation == null) {
      throw Exception(
          '''This Method is not available because the users location was not provided.\nYou can also initialize the object with the .noLocation() constructor to use the methods [similar, details, next venues, reviews].''');
    }

    // handles for converting to location into the correct format for the search endpoint
    var coordinates = await _locationConversion(location);

    // checks if the category is valid
    bool validCategory = await isCategoryId(category);

    // handles for the category options either returns a categoryid, null, or throws an error
    String? cat = validCategory ? category : await _handleCategory(category);

    var results = await trendingEndpoint(coordinates,
        radius: radius,
        limit: limit,
        query: query,
        category: cat,
        verbose: verbose);
    // return the results
    return results;
  }

  @deprecated
  bool isCoordinates(var input) {
    // handles for if coord is a map
    if (input is Map) {
      // check for the keys
      var containsLatLng = input.containsKey('lat') && input.containsKey('lng');
      var containsLatitudeLongitude =
          input.containsKey('latitude') && input.containsKey('longitude');
      if (containsLatitudeLongitude) {
        return true;
      } else if (containsLatLng) {
        return true;
      } else {
        throw Exception(
            "The parameter input must either contain the keys 'lat' 'lng' or 'latitude' 'longitude' not ${input.keys} ");
      }
    } else if (input is String) {
      // check to see if the string is numeric
      return _isNumeric(_remove(input)) ? true : false;
    } else {
      return false;
    }
  }

  @deprecated
  Future<bool> isVenueId(String input) async {
    // make sure the ID isn't a category ID
    if (await isCategoryId(input) == true) {
      return false;
    }

    // determines whether the input is a venueId
    var parts = input.split(' ');
    // if there is a single string present
    if (parts.length == 1) {
      // get the string
      var value = parts[0];

      // initialize counters
      var numericCount = 0;
      var characterCount = 0;

      // counts how many numeric charaters there are an non-numeric characters
      for (var element in value.split('')) {
        _isNumeric(element) ? numericCount++ : characterCount++;
      }

      // if the count of numerics is greater, it assumes the string is a venue ID
      var isId = numericCount > characterCount ? true : false;
      return isId;

      // if theres more than a single string present, it cant be a venueID
    } else {
      return false;
    }
  }

  Future<String?> _handleCategory(String? category) async {
    // handles for if the category provided is a category string and not an actual category id

    if (category == null) {
      return null;
    }
    // get the results from searching for the categoryID
    Map convertToCategory = await getCategoryId(category);
    // get the status of the search
    var status = convertToCategory['status'];
    // if the search was successful, set the categoryID
    if (status == 'key found') {
      return convertToCategory['value'];
    }
    // if the search wasn't successful, throw an error
    else if (status == 'key not found') {
      // if there were similar values return them
      // if there weren't create a message saying similar categories couldnt be found
      var similar = convertToCategory['similar'].length > 0
          ? "try changing the category to ${convertToCategory['similar']}"
          : 'and there are no similar search results';
      var message = "${convertToCategory['value']} ${similar}";
      throw Exception(message);
    }
  }

  Future<Map> _locationConversion(dynamic location) async {
    // use the initial location that was provided
    location = location ?? initialLocation;
    // convert the place into coordinates if the location is not already a map
    Map coordinates =
        location is Map ? location : await placeToCoordinates(location);

    return coordinates;
  }

  bool _isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String _remove(String value) {
    // removes whitespace, commas, periods, and minus signs from a string
    value = value.replaceAll(RegExp('[.,-]'), "");
    value = value.replaceAll(' ', '');
    return value;
  }
}

// class for handling endpoint data collection
class Endpoint {
  // credintials
  final String client_id = "FCZBGPFF4JMLSZZPCOMYN3MZMKS1UX0LOMZ4TM2RJ1PFYLFZ";
  final String key = "AFD5WN0QCRVP4SS4BLBJH33XRKB2KTIS3Q1QXJXTU0W1WHYV";
  // holds the default parameters needed for every query
  Map<String, String?>? baseParams;

  // the base URL for all requests
  final String baseURL = "api.foursquare.com";

  // Holds available venue categories
  // Map get categories {
  //   // String categories =
  //   //     await new File('API Client/categories.json').readAsString();
  //   // Map c = jsonDecode(categories);
  //   var cats = Categories();
  //   Map c = cats.categories;
  //   return c;
  // }
  final Map categories = Categories().categories;
  

  Future<List> get validCategories async => await _validCategoryIds();

  String get date {
    final now = DateTime.now();
    final formatter = new DateFormat('yyyyMMdd');
    final dateCode = formatter.format(now);
    return dateCode;
  }

  Endpoint() {
    baseParams = {
      'client_id': this.client_id,
      'client_secret': this.key,
      'v': date
    };
  }

  String _milesToMeters(num value) => (value * 1609.34).toString();

  // ignore: unused_element
  String _metersToMiles(num value) => (value / 1609.34).toString();

  Future<Map?> searchEndpoint(dynamic coordinates,
      {int? radius,
      String? query,
      int? limit,
      String? category,
      bool verbose = false}) async {
    // param options
    // coordinates -> latitude and longitude as a string
    // near -> A string naming a place in the world.
    // radius (default: 5 miles) -> Limit results to venues within this many meters of the specified location
    // query -> A search term to be applied against venue names.
    // limit (default: 25) -> Number of results to return, up to 50.

    final String _searchEndpoint = "/v2/venues/search";

    // set the parameters for the request from the base parameters
    var searchParams = baseParams!;
    searchParams['categoryId'] = category;
    searchParams['ll'] = _convertCoordinates(coordinates);
    searchParams['radius'] =
        radius == null ? _milesToMeters(5) : _milesToMeters(radius).toString();
    searchParams['query'] = query;
    searchParams['limit'] = limit == null ? '25' : limit.toString();

    // generate the url
    var url = Uri.https(baseURL, _searchEndpoint, searchParams);

    if (verbose) {
      print("Endpoint: Search\nFull URL: $url");
      print('Coordinates: ${searchParams['ll']}');
      print('radius: ${searchParams['radius']}');
      print('limit: ${searchParams['limit']}');
      print('query: ${searchParams['query']}');
      print('category: ${searchParams['categoryId']} \n');
    }
    // send the request and return the body response
    var response = await requests.get(url);
    var body = json.decode(response.body);

    return body;
  }

  Future<Map?> recommendEndpoint(dynamic coordinates,
      {String? section,
      num? radius,
      String? query,
      int? limit,
      String? category,
      bool verbose = false}) async {
    // param options
    // coordinates -> latitude and longitude as a string

    // section -> One of food, drinks, coffee, shops, arts, outdoors, sights, trending,
    //    nextVenues (venues frequently visited after a given venue), or topPicks
    //    (a mix of recommendations generated without a query from the user).
    //    Choosing one of these limits results to venues with the specified category or property.

    // radius -> Limit results to venues within this many meters of the specified location
    // query -> A search term to be applied against venue names.
    // limit -> Number of results to return, up to 50.

    // verbose to view extra output
    final String _exploreEndpoint = "/v2/venues/explore";
    var recParams = baseParams!;
    recParams['categoryId'] = category;
    recParams['ll'] = _convertCoordinates(coordinates);
    recParams['radius'] =
        radius == null ? _milesToMeters(5) : radius.toString();
    recParams['query'] = query;
    recParams['limit'] = limit == null ? '25' : limit.toString();
    // recParams['section'] = section;

    // generate the url
    var url = Uri.https(baseURL, _exploreEndpoint, recParams);

    if (verbose) {
      print("Endpoint: Explore (recommend) \nFull URL: $url \n${recParams}\n");
    }
    // send the request and return the body response
    var response = await requests.get(url);
    var body = json.decode(response.body);
    return body;
  }

  Future<Map?> similarEndpoint({var coordinates, var id, verbose: false}) async {
    // returns venues that are similar to the current one
    String? venue_id = await _handleLocation(coordinates: coordinates, id: id);

    // build the url
    final String _similarEndpoint = "/v2/venues/${venue_id}/similar";
    var url = Uri.https(baseURL, _similarEndpoint, baseParams);
    if (verbose) {
      print("Endpoint: Similar \nFull URL: $url \n");
    }
    // send the request and get the results
    var response = await requests.get(url);
    var body = json.decode(response.body);
    return body;
  }

  Future<Map?> detailsEndpoint({var coordinates, var id, verbose: false}) async {
    String? venue_id = await _handleLocation(coordinates: coordinates, id: id);

    // build the url
    final String _detailsEndpoint = "/v2/venues/$venue_id";
    var url = Uri.https(baseURL, _detailsEndpoint, baseParams);

    if (verbose) {
      print("Endpoint: Details \nFull URL: $url \n");
    }

    var response = await requests.get(url);
    Map? body = json.decode(response.body);
    return body;
  }

  Future nextVenuesEndpoint({var coordinates, var id, verbose: false}) async {
    String? venue_id = await _handleLocation(coordinates: coordinates, id: id);

    final String _nextEndpoint = "/v2/venues/$venue_id/nextvenues";
    var url = Uri.https(baseURL, _nextEndpoint, baseParams);

    if (verbose) {
      print("Endpoint: Next Venues \nFull URL: $url \n");
    }

    var response = await requests.get(url);
    var body = json.decode(response.body);
    return body;
  }

  Future reviewsEndpoint(
      {var coordinates, var id, int? limit, bool verbose: false}) async {
    String? venue_id = await _handleLocation(coordinates: coordinates, id: id);

    Map tipsParams = baseParams!;
    tipsParams['limit'] = limit == null ? '20' : limit.toString();
    tipsParams['sort'] = 'recent';

    final String _tipsEndpoint = "/v2/venues/$venue_id/tips";
    var url = Uri.https(baseURL, _tipsEndpoint, tipsParams as Map<String, dynamic>?);

    if (verbose) {
      print("Endpoint: Tips \nFull URL: $url \nParameters: ${tipsParams}\n");
    }

    var response = await requests.get(url);
    var body = json.decode(response.body);
    return body;
  }

  Future<String?> _handleLocation({var coordinates, var id}) async {
    String? venue_id;

    // if the user provided
    if (coordinates != null) {
      venue_id = await (_getVenueID(coordinates) as Future<String?>);
    } else if (id != null) {
      venue_id = id;
    } else {
      throw Exception("Please provide either coordinates or a venue_id");
    }

    return venue_id;
  }

  Future _getVenueID(var coordinates) async {
    // input coordinates and get the venue ID
    Map results = await (searchEndpoint(coordinates, limit: 1) as Future<Map<dynamic, dynamic>>);
    var vID = results['response']['venues'][0]['id'];
    return vID;
  }

  String _convertCoordinates(dynamic coord) {
    var coordString;

    // handles for if coord is a map
    if (coord is Map) {
      // check for the keys
      var containsLatLng = coord.containsKey('lat') && coord.containsKey('lng');
      var containsLatitudeLongitude =
          coord.containsKey('latitude') && coord.containsKey('longitude');
      if (containsLatitudeLongitude) {
        coordString = "${coord['latitude']}, ${coord['longitude']}";
      } else if (containsLatLng) {
        coordString = "${coord['lat']}, ${coord['lng']}";
      } else {
        throw Exception(
            "The parameter coord must either contain the keys 'lat' 'lng' or 'latitude' 'longitude' not ${coord.keys} ");
      }
    } else if (coord is String) {
      coordString = coord;
    } else {
      // print(coord.runtimeType);
      throw Exception(
          "coord parameter must be a Map or String not ${coord.runtimeType}");
    }

    return coordString;
  }

  Future<Map?> categories_() async {
    String categoryEndpoint = "/v2/venues/categories";
    var url = Uri.https(baseURL, categoryEndpoint, baseParams);
    var response = await requests.get(url);
    Map? body = json.decode(response.body);
    return body;
  }

  Future<Map?> trendingEndpoint(dynamic coordinates,
      {int? radius,
      String? query,
      int? limit,
      String? category,
      bool verbose = false}) async {
    final _trendEndpoint = "/v2/venues/trending";
    var trendParams = baseParams!;
    trendParams['categoryid'] = category;
    trendParams['radius'] =
        radius == null ? _milesToMeters(5) : radius.toString();
    trendParams['query'] = query;
    trendParams['limit'] = limit == null ? '25' : limit.toString();
    trendParams['ll'] = _convertCoordinates(coordinates);

    // generate the url
    var url = Uri.https(baseURL, _trendEndpoint, trendParams);
    if (verbose) {
      print("Endpoint: Trending\nFull URL: $url");
      print('Coordinates: ${trendParams['ll']}');
      print('radius: ${trendParams['radius']}');
      print('limit: ${trendParams['limit']}');
      print('query: ${trendParams['query']}');
      print('category: ${trendParams['categoryid']} \n');
    }
    var response = await requests.get(url);
    Map? body = json.decode(response.body);
    return body;
  }

  Future<List> _validCategoryIds() async {
    // returns a list of all valid category ids
    // get the categorys
    var cat = await categories;
    // extract all the root categories
    var valid = [];

    // loop through each root key
    for (var key in cat.keys) {
      // add the id to the valid ids list
      valid.add(cat[key]['id']);
      // if the root has children
      if (cat[key]['has_children']) {
        // get the children list (format is a list of Maps)
        var children = cat[key]['children'];
        // for each child get the value (which is the id)
        for (var child in children) {
          var id = child.values.toString();
          // remove parentheses
          id = id.replaceAll(RegExp('[()]'), "");
          valid.add(id);
        }
      }
    }
    // extract all of the children categories
    // return the list of categories
    return valid;
  }

  Future<Map> getCategoryId(String category) async {
    // check to see if the categories contains the 'category' key
    var cat = await categories;

    category = category.toLowerCase();

    // store values that are close to what your looking for
    List almost = [];

    // check to see if the map has the key in root
    if (cat.containsKey(category)) {
      return {'value': cat[category]['id'], 'status': 'key found'};
    } else {
      // if the key is not in root, check the children
      // print("Checking children");
      for (var key in cat.keys) {
        if (_almostKey(category, key)) {
          almost.add(key);
        }
        // check to see if the root has children
        if (cat[key]['has_children']) {
          // get the list of children
          var childrenList = cat[key]['children'];
          // check the children for the key
          for (var child in childrenList) {
            // hold the current key
            // the children list is in this format (list of Maps)
            // [{'categoryName':id, 'categoryName':id}]
            var currentKey = child.keys.toString();
            // if the key is found in the list of children
            if (child.containsKey(category)) {
              return {'value': child[category], 'status': 'key found'};
              // if the key doesnt match but its similar to the target key
            } else if (_almostKey(category, currentKey)) {
              almost.add(currentKey);
            }
          }
        }
        // if they do, check the children for the key
        // if not, continur
      }
    }

    // if the children doesnt contain the key return that the Key cannot be found
    var message = "The key '$category' could not be found";
    return {'value': message, 'similar': almost, 'status': 'key not found'};
  }

  Future<bool> isCategoryId(String? categoryId) async {
    // returns true or false which tells you if a string is a valid category or not
    var valid = await validCategories;
    return valid.contains(categoryId) ? true : false;
  }

  bool _almostKey(String targetCategory, String currentCategory) {
    return currentCategory.contains(targetCategory);
  }
}
