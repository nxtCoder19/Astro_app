import 'package:astro_app/model/MatchesDetails.dart';
import 'package:astro_app/utils/validator/AccessSharedPreference.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchApi {
  static Future<List> getSearchDetails(String age, int preference, String seeking,
                                       int startLimit, int endLimit) async {
  var response;
  String url = 'http://amitg.world/astroapi/search.php?age=${age.toString()}&preferance=${preference.toString()}&seeking=${seeking.toString()}&startlimit=${startLimit.toString()}&endlimit=${endLimit.toString()}';
  String userToken = await AccessSharedPreference.getUserToken();
    Map<String, String> headers = {};
    if (userToken != null) {
      headers = {'Authorization': 'Bearer ' + userToken};
    }
  try {
  response = await http.get(
     url,
     headers: headers);
  } catch(exception) {
    throw exception;
  }
  if (response != null) {
    var result = jsonDecode(response.body);
    print(result);
    print(result['message']);
    return result['message'];
    //print(result['message']);
    print(url);
  } else {
    throw Exception();
  }
}

  static Future<List<MatchesDetails>> getMatches(String age, int preference, String seeking,
                                       int startLimit, int endLimit) async {
  var response;
  String ages = '18'+'-'+age;
  String url = 'http://amitg.world/astroapi/search.php?age=${ages.toString()}&preferance=${preference.toString()}&seeking=${seeking.toString()}&startlimit=${startLimit.toString()}&endlimit=${endLimit.toString()}';
  String userToken = await AccessSharedPreference.getUserToken();
    Map<String, String> headers = {};
    if (userToken != null) {
      headers = {'Authorization': 'Bearer ' + userToken};
    }
  try {
  response = await http.get(
     url,
     headers: headers);
  } catch(exception) {
    throw exception;
  }
  if (response != null) {
    List<MatchesDetails> allMatch = [];
    var result1 = jsonDecode(response.body);
    print(url);
    print('p');
    var result = result1['message'];
    print(result.length);
    print(result1);
    print('xxx');
    print(result1['message']);
    result.forEach((salon) {
      MatchesDetails matchDetails = MatchesDetails.fromJson(salon);
      allMatch.add(matchDetails);
    });
    return allMatch;
  } else {
    throw Exception();
  }
}

}