import 'package:astro_app/utils/validator/AccessSharedPreference.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SingleUserMessageApi {
  static Future<List> getSingleUserMessageDetails(String userid,int startLimit, int endLimit) async {
  var response;
  String url = 'http://amitg.world/astroapi/getsingleusermessagedetails.php?otheruserid=${userid.toString()}&startlimit=${startLimit.toString()}&endlimit=${endLimit.toString()}';
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
    print(url);
  } else {
    throw Exception();
  }
}
}