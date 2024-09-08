import 'dart:convert';
import 'dart:developer';

import 'package:google_book_api/ApiServices/book_api_modal.dart';
import 'package:http/http.dart';

extension on Response {
  bool get isSuccessfull => statusCode == 200;
}

class ApiServices {
  String get baseUrl => "https://www.googleapis.com/books/v1/volumes?q=";
  dynamic fetch({String endpoint = ""}) async {
    var response = await get(Uri.parse(baseUrl + endpoint));
    log("Complete URL = $baseUrl$endpoint");
    if (response.isSuccessfull) {
      log("Response is successfull");
      log('Data : ${jsonDecode(response.body)}');
      return jsonDecode(response.body);
    }
    return null;
  }
}

class BookApiServices extends ApiServices {
  Future<BookApiModal> fetchBookData({required String endPoint}) async {
    Map<String, dynamic> bookInfoMap = await fetch(endpoint: endPoint);
    log("Info Fetched");
    var book = BookApiModal.fromJson(bookInfoMap);
    log('Id' + book.totalItems.toString());
    return book;
  }
}
