import 'dart:convert';
import 'package:astro_app/utils/validator/AccessSharedPreference.dart';
import 'package:http/http.dart' as http;

class userApi {

  static Future<bool> sendOtpRequest(String email, String password) async{
    var response;
    String serviceKey = 'register';
    String url = 'http://amitg.world/astroapi/';
    var data = {
      "email": email,
      "password": password
    };
    var body = {
      "serviceKey": serviceKey,
      "data":data
    };
    response = await http.post(url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(body)
    );
    var result = jsonDecode(response.body);
    var token1 = result['access_token'] as String;
    print('aaa');
    print(token1);
    //await _saveTokenInSharedPreference(token1); 
    await AccessSharedPreference.saveUserTokenToSharedPreference(
        token1);
    if (result['status'] == "success") {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> loginRequest(String email, String password) async{
    var response;
    String serviceKey = 'login';
    String url = 'http://amitg.world/astroapi/';
    var data = {
      "email": email,
      "password": password
    };
    var body = {
      "serviceKey": serviceKey,
      "data":data
    };
    response = await http.post(url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(body)
    );
    var result = jsonDecode(response.body);
    var token1 = result['access_token'] as String;
    print('aaa');
    print(token1);
    //await _saveTokenInSharedPreference(token1); 
    await AccessSharedPreference.saveUserTokenToSharedPreference(
        token1);
    if (result['status'] == "success") {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> otpVerification(String otp) async{
    var response;
    String serviceKey = 'verification';
    String url = 'http://amitg.world/astroapi/';
    String userToken = await AccessSharedPreference.getUserToken();
    Map<String, String> headers = {};
    if (userToken != null) {
      headers = {'Authorization': 'Bearer ' + userToken};
    }
    print('bbb');
    print(userToken);
    print(headers);
    print(otp);
    var data = {
      "verificationcode": otp
    };
    var body = {
      "serviceKey": serviceKey,
      "data":data
    };
    response = await http.post(url,
    headers: headers,
    body: jsonEncode(body)
    );
    var result = jsonDecode(response.body);
    print('xxx');
    print(result);
    if (result['status'] == "success") {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> addOtherInfo(
    String name, String gender, String seeking, String birthdate,
    String birthtime, String city, String country, String tags, String relationshipstatus
  ) async{
    var response;
    String serviceKey = 'addotherinfo';
    String url = 'http://amitg.world/astroapi/';
    String userToken = await AccessSharedPreference.getUserToken();
    Map<String, String> headers = {};
    if (userToken != null) {
      headers = {'Authorization': 'Bearer ' + userToken};
    }
    print('bbb');
    print(userToken);
    print(headers);
    //print(otp);
    var data = {
      "name": name,
      "gender": gender,
      "seeking": seeking,
      "birthdate": birthdate,
      "birthtime": birthtime,
      "city": city,
      "country": country,
      "tags": tags,
      "relationshipstatus": relationshipstatus
    };
    var body = {
      "serviceKey": serviceKey,
      "data":data
    };
    print(body);
    response = await http.post(url,
    headers: headers,
    body: jsonEncode(body)
    );
    var result = jsonDecode(response.body);
    print('result');
    print(result);
    print(body);
   // getUserDetails();
    if (result['status'] == "success") {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> getUserDetails() async{
    var response;
    String url = 'http://amitg.world/astroapi/getuserdetails.php';
    String userToken = await AccessSharedPreference.getUserToken();
    Map<String, String> headers = {};
    if (userToken != null) {
      headers = {'Authorization': 'Bearer ' + userToken};
    }
    response = await http.get(url,
    headers: headers,
    );
    var result = jsonDecode(response.body);
    print("get"+result);
    if (result['status'] == "success") {
      return true;
    } else {
      return false;
    }
  }

}