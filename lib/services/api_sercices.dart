import 'dart:convert';
import 'dart:io';

import 'package:chatgpt_api_study_231126/const.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<void> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {"Authorization": "Bearer $api"},
      );
      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        print("${jsonResponse['error']['message']}");
        throw HttpException(jsonResponse['error']['message']);
      }
      print('JsonResponse $jsonResponse');
    } catch (error) {
      print('error $error');
    }
  }
}
