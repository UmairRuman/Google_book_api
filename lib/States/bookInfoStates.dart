import 'package:flutter/material.dart';
import 'package:google_book_api/ApiServices/book_api_modal.dart';

@immutable
abstract class BookInfoState {}

@immutable
class BookInfoLoadingState extends BookInfoState {}

@immutable
class BookInfoIntialState extends BookInfoState {}

@immutable
class BookInfoLoadedState extends BookInfoState {
  final BookApiModal bookInfo;
  BookInfoLoadedState({required this.bookInfo});
}

@immutable
class BookInfoErrorState extends BookInfoState {
  final String error;
  BookInfoErrorState({required this.error});
}
