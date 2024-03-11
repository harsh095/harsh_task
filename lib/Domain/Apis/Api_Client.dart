import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient{
  
  Future<List<dynamic>> fetchGet(String apiUrl) async {
    var response = await http.get(Uri.parse(apiUrl) );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
