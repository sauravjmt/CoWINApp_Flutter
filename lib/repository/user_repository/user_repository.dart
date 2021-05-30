import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static const String TXN_ID = "txnId";
  static const String PHONE_NUMBER = "phoneNumber";
  static const String TOKEN = 'token';

  Future<void> deleteSPrefItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
    return;
  }

  Future<void> persistSPrefItem(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    return;
  }

  Future<String> getSPrefItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> hasSPrefItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
