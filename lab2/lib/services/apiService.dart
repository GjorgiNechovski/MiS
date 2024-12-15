import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService{

  static Future<http.Response> getTypes() async {
    var response = await http.get(Uri.parse("https://official-joke-api.appspot.com/types"));
    return response;
  }

  static Future<dynamic> getJokesForType(String type) async{
    final response = await http.get(Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
    else{
      throw Exception("Failed to load data!");
    }
  }

  static Future<dynamic> getRandomJoke() async{
    final response = await http.get(Uri.parse("https://official-joke-api.appspot.com/jokes/random"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
    else{
      throw Exception("Failed to load data!");
    }
  }}