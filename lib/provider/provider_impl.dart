import 'dart:convert';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DataFromApi extends ChangeNotifier {
  static const _baseUrl = "https://dog.ceo";
  static const _apiUrl = "$_baseUrl/api";
  static const _dogListEndpointUrl = '$_apiUrl/breeds/list/all';
  static const _messageKey = 'message';
  static const _countImages = 10;

  String _dogImageEndpointUrl(Breed breed) =>
      '$_apiUrl/breed/${breed.breed}/images/random/$_countImages';

  final _myDogsList = <Breed>[];

  get newDogList => _myDogsList;

  Future<void> getData() async {
    final url = Uri.parse(_dogListEndpointUrl);
    final response = await get(url);
    Map<String, dynamic> responseMap = json.decode(response.body);
    final messageMap = Map<String, dynamic>.from(responseMap[_messageKey]);
    final dogMainBreeds = messageMap.keys.toList();
    for (var d in dogMainBreeds) {
      List putSubBreeds = messageMap[d];
      if (putSubBreeds.isEmpty) {
        _myDogsList.add(Breed(d));
      } else {
        for (var s in putSubBreeds) {
          _myDogsList.add(Breed(d, subBreed: s));
        }
      }
    }
    notifyListeners();
  }

  List<String> _dogImages = [];

  List<String> get dogImages => _dogImages;

  Future<void> getImage(Breed breed) async {
    final url = Uri.parse(_dogImageEndpointUrl(breed));
    final response = await get(url);
    final Map<String, dynamic> responseMap = json.decode(response.body);
    final List<dynamic> responseList = responseMap[_messageKey];
    _dogImages = List<String>.from(responseList);
    notifyListeners();
  }
}
