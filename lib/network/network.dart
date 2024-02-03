import 'dart:convert';

import 'package:reader_tracker/models/book.dart';
import 'package:http/http.dart' as http;

class Network {
  //api endpoint
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<void> searchBooks(String query) async {
    var url = Uri.parse('$_baseUrl?q=$query');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // we have data (json)
      var data = json.decode(response.body);
      print(data['totalItems']);
    } else {
      // return ;
    }
  }
}
