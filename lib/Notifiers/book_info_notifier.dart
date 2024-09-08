import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_book_api/ApiServices/api_services.dart';
import 'package:google_book_api/ApiServices/book_api_modal.dart';
import 'package:google_book_api/States/bookInfoStates.dart';

class BookInfoNotifier extends StateNotifier<BookInfoState> {
  BookInfoNotifier() : super(BookInfoIntialState());
  BookApiServices bookApiServices = BookApiServices();

  void fetchBookInfo({required String endPoint}) async {
    state = BookInfoLoadingState();
    try {
      BookApiModal data =
          await bookApiServices.fetchBookData(endPoint: endPoint);
      log("Data Found");
      state = BookInfoLoadedState(bookInfo: data);
    } catch (e) {
      state = BookInfoErrorState(error: e.toString());
      log("Throws error");
    }
  }
}
