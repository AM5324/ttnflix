import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferencesManager? _instance;
  static SharedPreferences? _preferences;

  SharedPreferencesManager._();

  static Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<SharedPreferencesManager> getInstance() async {
    _instance ??=
        SharedPreferencesManager._(); // Change here: Initialize if null
    await _init(); // Move the initialization inside getInstance method
    return _instance!; // Change here: Add a non-null assertion
  }

  // Save and retrieve String
  String getString(String key, {required String defaultValue}) {
    return _preferences?.getString(key) ?? defaultValue;
  }

  Future<void> saveString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  // Save and retrieve JSON using a model
  T? getObject<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final jsonString = _preferences?.getString(key);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return fromJson(jsonMap);
    }
    return null;
  }

  Future<void> saveObject(String key, dynamic object) async {
    final jsonString = json.encode(object.toJson());
    await _preferences?.setString(key, jsonString);
  }

  // Save and retrieve a list of JSON using a model
  List<T> getList<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final jsonStringList = _preferences?.getStringList(key);
    if (jsonStringList != null) {
      return jsonStringList.map((jsonString) {
        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        return fromJson(jsonMap);
      }).toList();
    }
    return [];
  }

  Future<void> saveList(String key, List<dynamic> list) async {
    final jsonStringList = list.map((item) => json.encode(item)).toList();
    await _preferences?.setStringList(key, jsonStringList);
  }

  // Remove a list from SharedPreferences
  Future<void> removeList(String key) async {
    await _preferences?.remove(key);
  }
}
