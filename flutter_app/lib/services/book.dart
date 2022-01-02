import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/models/category.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService();

  final String baseUrl = 'http://192.168.43.241:8000/api/book';

  Future<List<Category>> fetchCategories() async {
    http.Response response = await http.get(
      Uri.parse(baseUrl + 'categories'),
    );

    List categories = jsonDecode(response.body);

    return categories.map((category) => Category.fromJson(category)).toList();
  }

  Future updateCategory(id, name) async {
    String uri = baseUrl + 'categories/' + id.toString();

    http.Response response = await http.put(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
      body: jsonEncode({'name': name}),
    );

    if (response.statusCode != 200) {
      throw Exception('Error happened on update');
    }

    return Category.fromJson(jsonDecode(response.body));
  }
}
