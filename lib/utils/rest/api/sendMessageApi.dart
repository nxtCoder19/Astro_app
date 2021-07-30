import 'dart:convert';
import 'package:astro_app/utils/validator/AccessSharedPreference.dart';
import 'package:http/http.dart' as http;

class SendMessageApi {

  static Future<bool> sendMessage(String userId) async{
    var response;
    String serviceKey = 'sendmessage';
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
      "userid": userId,
      "message": "hello"
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
    print(body);
    print('result');
    print(result);
    if (result['status'] == "success") {
      return true;
    } else {
      return false;
    }
  }

}