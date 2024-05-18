import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/book.dart';

class BookService {
  static Future<List<Book>> getBooks() async {
    final data = await rootBundle.loadString('assets/data.json');
    final List<dynamic> jsonResult = json.decode(data);
    return jsonResult.map((json) => Book.fromJson(json)).toList();
  }
}
