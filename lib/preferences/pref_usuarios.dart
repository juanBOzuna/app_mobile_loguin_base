import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get getUltimaPagina {
    return _prefs.getString('ultima_pagina') ?? 'login';
  }

  set SetUltimaPagina(String ultimaPagina) {
    _prefs.setString('ultima_pagina', ultimaPagina);
  }
}
