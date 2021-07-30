
import 'package:shared_preferences/shared_preferences.dart';

class AccessSharedPreference {
  static SharedPreferences prefs = null;

  static getSharedPreferenceObject() async {
    if (AccessSharedPreference.prefs == null) {
      AccessSharedPreference.prefs = await SharedPreferences.getInstance();
    }
    return AccessSharedPreference.prefs;
  }

  static saveUserTokenToSharedPreference(
      String tokenValue) async {
    SharedPreferences prefs =
        await AccessSharedPreference.getSharedPreferenceObject();
    prefs.setString('userToken', tokenValue);
    //prefs.setString('phoneNumber', phoneNumber);
  }

  static getUserToken() async {
    SharedPreferences prefs =
        await AccessSharedPreference.getSharedPreferenceObject();
    return prefs.getString('userToken');
  }
}
