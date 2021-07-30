import 'dart:convert';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/utils/rest/response.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as DioClass;

enum API_CALL_TYPE {
  HTTP_POST,
  HTTP_GET,
  HTTP_DELETE,
  HTTP_PATCH,
  DIO_POST,
  DIO_GET,
  DIO_PATCH,
  DIO_DELETE
}

class NetworkCall {
  static String _generateUrl(String endPoint, {bool isExternal = false}) {
    if (isExternal) {
      return endPoint;
    }
    return HOST + "amitg.world/" + endPoint;
  }

  static Future<ResponseBody> makeNetworkCall(
      API_CALL_TYPE callType, String endPoint,
      {var body, bool isExternal = false}) async {
    //String userToken = await AccessSharedPreference.getUserToken();
    String url = _generateUrl(endPoint, isExternal: isExternal);
    Map<String, String> headers = {};
    //if (userToken != null) {
      //headers = {'Authorization': 'Bearer ' + userToken};
    //}
    var response;
    try {
      switch (callType) {
        case API_CALL_TYPE.HTTP_POST:
          headers['Content-type'] = 'application/json';
          response =
              await http.post(url, headers: headers, body: jsonEncode(body));
          break;
        case API_CALL_TYPE.HTTP_GET:
          response = await http.get(url, headers: headers);
          break;
        case API_CALL_TYPE.HTTP_DELETE:
          response = await http.delete(url, headers: headers);
          break;
        case API_CALL_TYPE.HTTP_PATCH:
          headers['Content-type'] = 'application/json';
          response =
              await http.patch(url, headers: headers, body: jsonEncode(body));
          break;
        case API_CALL_TYPE.DIO_POST:
          DioClass.FormData formData = new DioClass.FormData.fromMap(body);
          DioClass.Dio dio = new DioClass.Dio();
          await dio.post(url,
              data: formData, options: DioClass.Options(headers: headers));
          break;
        case API_CALL_TYPE.DIO_GET:
          DioClass.Dio dio = new DioClass.Dio();
          await dio.get(url, options: DioClass.Options(headers: headers));
          break;
        case API_CALL_TYPE.DIO_PATCH:
          DioClass.FormData formData = new DioClass.FormData.fromMap(body);
          DioClass.Dio dio = new DioClass.Dio();
          await dio.patch(url,
              data: formData, options: DioClass.Options(headers: headers));
          break;
        case API_CALL_TYPE.DIO_DELETE:
          DioClass.Dio dio = new DioClass.Dio();
          await dio.delete(
            url,
            options: DioClass.Options(headers: headers),
          );
          break;
      }
    } catch (exception) {
      throw exception;
    }
    if (response != null) {
      ResponseBody responseBody = ResponseBody.fromJson(response);
      return responseBody;
    } else {
      throw Exception();
    }
  }

  static checkImageLinkValidity(String imageUrl) async {
    bool isValid = true;
    final response = await http.head(imageUrl);
    if (response.statusCode >= 400) {
      isValid = false;
    }
    return isValid;
  }
}
