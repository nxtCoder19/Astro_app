import 'package:astro_app/utils/validator/AccessSharedPreference.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetUserDetailsApi {
    static Future<List> getUserDetails() async {
    var response;
    String userToken = await AccessSharedPreference.getUserToken();
      Map<String, String> headers = {};
      if (userToken != null) {
        headers = {'Authorization': 'Bearer ' + userToken};
      }
    try {
    response = await http.get('http://amitg.world/astroapi/getuserdetails.php',
                    headers: headers);
    } catch(exception) {
      throw exception;
    }
    if (response != null) {
      var result = jsonDecode(response.body);
      print(result);
    } else {
      throw Exception();
    }
  }

  static Future<String> getUserName() async {
    var response;
    String userToken = await AccessSharedPreference.getUserToken();
      Map<String, String> headers = {};
      if (userToken != null) {
        headers = {'Authorization': 'Bearer ' + userToken};
      }
    try {
    response = await http.get('http://amitg.world/astroapi/getuserdetails.php',
                    headers: headers);
    } catch(exception) {
      throw exception;
    }
    if (response != null) {
      var result = jsonDecode(response.body)['message']['name'];
      print(result);
      return result;
    } else {
      throw Exception();
    }
  }
}