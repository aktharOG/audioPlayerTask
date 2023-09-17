import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  //Singleton class
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return _instance;
  }

  SharedPreferencesService._internal();

  static late final SharedPreferences prefs;

  Future<void> setPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  saveListMOdel(List<String> chapterList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

// Convert the list of Chapter instances to JSON format
    List<String> chapterJsonList = chapterList;

// Save the JSON string list to shared preferences
    await prefs.setStringList('recent', chapterJsonList);
    log("d saved localyy");
  }

  Future<List<String>> getListModel() async {
    // Get the saved JSON string list from shared preferences
    List<String>? chapterJsonList = prefs.getStringList('recent');

// Convert the JSON string list back to a list of Chapter instances
    if (chapterJsonList != null) {
      List<String> chapterList = chapterJsonList;
      return chapterList;
    } else {
      print("empty history");
      return [];
    }
  }

  deleteModel(int index) async {
    List<String>? chapterJsonList = prefs.getStringList('recent');

    if (chapterJsonList != null) {
      // Convert the JSON string list back to a list of Chapter instances
      List<String> chapterList = chapterJsonList;
    
      // Remove the specific data from the list of Chapter instances
      chapterList.removeAt(index);
        
      // Convert the updated list of Chapter instances back to a list of JSON strings
      List<String> updatedChapterJsonList = chapterList;

      // Save the updated list of JSON strings to shared preferences
      prefs.setStringList('recent', updatedChapterJsonList);

      return chapterList;
    } else {
      return null;
    }
  }

  clearHistory() async {
    await prefs.clear();
  }
}
