import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:mocked_list_of_breeds/data/services/network_service.dart';

class NetworkServiceImpl implements NetworkService {
  static const _baseUrl = "https://dog.ceo";
  static const _apiUrl = "$_baseUrl/api";
  static const _dogListEndpointUrl = '$_apiUrl/breeds/list/all';
  static const _messageKey = 'message';
  static const _countImages = 10;

  @override
  Future<Map<String, dynamic>> getData() async {
    final url = Uri.parse(_dogListEndpointUrl);
    var response = await get(url);
    Map<String, dynamic> responseMap = json.decode(response.body);
    final messageMap = Map<String, dynamic>.from(responseMap[_messageKey]);
    return messageMap;
  }
}
