import 'dart:convert';

import 'package:hrm_emedicare/models/language_model/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? prefs;
  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  getuser() async {
    await init();
    String? username = prefs?.getString("userName");
    return username;
  }

  setuser(username) async {
    await init();
    prefs?.setString("userName", username);
  }

  getpassword() async {
    await init();
    String? password = prefs?.getString("Password");
    return password;
  }

  setpassword(password) async {
    await init();
    prefs?.setString("Password", password);
  }

  getusername() async {
    await init();
    String? password = prefs?.getString("username");
    return password;
  }

  setusername(username) async {
    await init();
    prefs?.setString("username", username);
  }

  setLanguage(LanguageModel? language) async {
    SharedPreferences s = await SharedPreferences.getInstance();
    s.setString('language', jsonEncode(language));
  }

  Future<LanguageModel?> getLanguage() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String? data = s.getString("language");
    LanguageModel? lang;
    if (data != null) {
      lang = LanguageModel.fromJson(jsonDecode(data));
    } else {
      lang = null;
    }
    return lang;
  }

  static savefingerprint(bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('fingerprint', val);
  }

  static getfingerprint() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool returnvalue = prefs.getBool('fingerprint') ?? false;
    return returnvalue;
  }
}
