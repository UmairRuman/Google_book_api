import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_book_api/Notifiers/book_info_notifier.dart';
import 'package:google_book_api/States/bookInfoStates.dart';

final bookInfoProvider =
    StateNotifierProvider<BookInfoNotifier, BookInfoState>((ref) {
  return BookInfoNotifier();
});
