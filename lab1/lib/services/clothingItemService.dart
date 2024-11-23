
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lab1/models/ClothingItem.dart';

class ClothingItemService {
  static const String _url = 'https://fakestoreapi.com/products';

  Future<List<ClothingItem>> fetchClothingItems() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        return data.map((item) => ClothingItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Failed to load products: $error');
    }
  }
}
