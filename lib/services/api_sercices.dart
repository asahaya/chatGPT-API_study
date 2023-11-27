import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatgpt_api_study_231126/const.dart';
import 'package:chatgpt_api_study_231126/model/models_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
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
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        log("temp ${value["id"]}");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      log('error $error');
      rethrow;
    }
  }
}
