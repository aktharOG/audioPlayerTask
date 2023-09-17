import 'dart:convert';
import 'dart:developer';
//
import 'package:audio_player/models/artist_model.dart';
import 'package:audio_player/models/recordings_model.dart';
import 'package:audio_player/services/shared_pref_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/genre_model.dart';
import '../services/api_service.dart';
import '../services/apis.dart';
import '../view/screens/tabs/home_tab.dart';
import '../view/screens/tabs/search_tab.dart';

class HomeProviderWF extends ChangeNotifier {
  SharedPreferencesService preferencesService = SharedPreferencesService();

  TextEditingController searchController = TextEditingController();
  int _nav = 0;

  get currentNavIndex => _nav;

  set changeNavIndex(int index) {
    _nav = index;
    notifyListeners();
  }

  List screens = const [HomeTab(), SearchTab()];

  // apis

  // ! fetch all genres
  GenreModel? genreModel;
  List<Genre> genreList = [];

  fetchGenresAPI() async {
    try {
      Response? response = await ApiService.apiMethodSetup(
          method: apiMethod.get, url: allGenreAPI);

      if (response != null) {
        print(response.data);
        final data = jsonEncode(response.data);
        genreModel = genreModelFromJson(data);
        print(genreModel!.genres.length);
        final listData = jsonEncode(genreModel!.genres);
        genreList = genreFromJson(listData);
        notifyListeners();
        print("total genres : ${genreList.length}");
      }
    } catch (e) {
      print("error : $e");
    }
  }

  //! fetch Genre Details by id
  bool isDetailsLoading = false;
  Map? genreDetailsData;
  fetchGenreDetailsByIdAPI(id) async {
    isDetailsLoading = true;
    notifyListeners();
    try {
      Response? response = await ApiService.apiMethodSetup(
          method: apiMethod.get, url: "$genreDetailsByIdAPI/$id");

      if (response != null) {
        print(response.data);
        isDetailsLoading = false;
        genreDetailsData = response.data;
        print(genreDetailsData);

        notifyListeners();
      }
    } catch (e) {
      print("error : $e");
    }
  }

  //! search artist
  bool isSearchLoading = false;

  ArtistModel? artistModel;
  RecordingModel? recordingModel;

  List<ArtistM> artistList = [];
  List<Recording> recordingslist = [];

  Dio dio = Dio();
  searchArtist() async {
    try {
      if (searchController.text.isNotEmpty) {
        isSearchLoading = true;
        notifyListeners();
        Response? response = await dio.get('$baseUrl$searchArtistAPI',
            queryParameters: {'query': searchController.text},
            options:
                Options(headers: {Headers.acceptHeader: 'application/json'}));

        if (response.data != null) {
          final data = jsonEncode(response.data["artists"]);
       
          artistList = artistFromJson(data);
          isSearchLoading = false;
          notifyListeners();
          print("total Artist : ${artistList.length}");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  searchRecordings() async {
    try {
      if (searchController.text.isNotEmpty) {
        isSearchLoading = true;
        notifyListeners();
        var response = await dio.get('$baseUrl$searchRecordingsAPI',
            queryParameters: {'query': searchController.text},
            options:
                Options(headers: {Headers.acceptHeader: 'application/json'}));
        if (response.data != null) {
          final data = jsonEncode(response.data["recordings"]);
        
          recordingslist = recordingsFromJson(data);
          isSearchLoading = false;
          notifyListeners();
          print("total recordings : ${recordingslist.length}");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  search() {
    searchArtist();
    searchRecordings();
    saveSearchHistory();
  }

  //! switch artists

  bool isSwitch = false;

  switchToRecordings() {
    isSwitch = false;
    notifyListeners();
  }

  switchToArtists() {
    isSwitch = true;
    notifyListeners();
  }

  //! recent searches
  List<String> history = [];
  //! save

  saveSearchHistory() async{
   bool isExist = history.any((e) => e.contains(searchController.text));
   if(!isExist){
 history =await preferencesService.getListModel();
    history.add(searchController.text);
    preferencesService.saveListMOdel(history);
    notifyListeners();
   }
   
  }

  //! get

  getSearchhistory() async{
    history =await preferencesService.getListModel();
    history.sort((a, b) => b.compareTo(a),);
    print("saved history : ${history.length}");
    notifyListeners();
  }

  //! delete
   deleteHistory(value) async{
  await preferencesService.deleteModel(value);
   history.remove(value);
   getSearchhistory();
    notifyListeners();
  }

  //! clear all

   clearALLHistory(){
    history.clear();
    preferencesService.clearHistory();
    notifyListeners();
   }
}
