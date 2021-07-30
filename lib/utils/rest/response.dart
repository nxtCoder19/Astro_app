import 'dart:convert';
import 'package:http/http.dart' as http;

class ResponseBody {
  bool isSuccess;
  dynamic mainBody;
  ResponseBody(this.isSuccess, this.mainBody);

  static ResponseBody fromJson(http.Response response) {
    Map<String, dynamic> json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (json.containsKey("success")) {
        return new ResponseBody(true, json['success']);
      } else if (json.containsKey("error")) {
        return new ResponseBody(false, json['error']);
      } else {
        return new ResponseBody(false, "unable to connect with server");
      }
    } else {
      return new ResponseBody(false, json['message']);
    }
  }
}
