import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class JsonService {
  /*
    text => {}
  */
  static Map<String, dynamic> convertStringToJson(String text) {
    return json.decode(text);
  }

  /*
    {} => text
  */
  static String convertJsonToString(Map<String, dynamic> jsonData) {
    return json.encode(jsonData);
  }

  /*
    @param filePath - path to json file
  */
  static Future<String> readJsonFileAndReturnString(String filePath) async {
    try {
      String response = await rootBundle.loadString(filePath);
      return response;
    } catch (e) {
      throw Exception('Can not read file: $filePath | $e');
    }
  }
}
