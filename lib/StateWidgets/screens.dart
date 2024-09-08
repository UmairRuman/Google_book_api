import 'package:flutter/material.dart';
import 'package:google_book_api/ApiServices/book_api_modal.dart';
import 'package:google_book_api/Decoration/containerDecoration.dart';

class IntialStateWidget extends StatelessWidget {
  const IntialStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Click To Fetch Data",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    );
  }
}

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class LoadedStateWidget extends StatelessWidget {
  final BookApiModal bookApiModal;
  const LoadedStateWidget({super.key, required this.bookApiModal});

  @override
  Widget build(BuildContext context) {
    var bookImage = bookApiModal.items![0].volumeInfo!.imageLinks!.thumbnail!;
    var bookTitle = bookApiModal.items![0].volumeInfo!.title;
    var bookRating = bookApiModal.items![0].volumeInfo!.maturityRating;
    var authorName = bookApiModal.items![0].volumeInfo!.authors![0];
    var publisherAndPublishedDate =
        "${bookApiModal.items![0].volumeInfo!.publisher} on ${bookApiModal.items![0].volumeInfo!.publishedDate}";
    return Container(
      height: 600,
      width: 400,
      decoration: ContainerDecoration.decoration,
      child: Column(
        children: [
          const Spacer(
            flex: 5,
          ),
          Expanded(
              flex: 40,
              child: Row(
                children: [
                  const Spacer(
                    flex: 5,
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  Expanded(flex: 30, child: Image.network(bookImage)),
                  const Spacer(
                    flex: 5,
                  ),
                  Expanded(
                      flex: 30,
                      child: Column(
                        children: [
                          const Spacer(
                            flex: 5,
                          ),
                          Expanded(
                              flex: 20,
                              child: Text(
                                bookTitle!,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Spacer(
                            flex: 4,
                          ),
                          Expanded(
                              flex: 20,
                              child: Text(
                                bookRating.toString(),
                                style: TextStyle(color: Colors.red),
                              )),
                          const Spacer(
                            flex: 3,
                          ),
                          Expanded(
                              flex: 20,
                              child: Text(
                                authorName,
                                style: const TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Spacer(
                            flex: 3,
                          ),
                          Expanded(
                              flex: 23,
                              child: Text(
                                publisherAndPublishedDate,
                                style: const TextStyle(color: Colors.green),
                              )),
                          const Spacer(
                            flex: 2,
                          )
                        ],
                      )),
                  const Spacer(
                    flex: 25,
                  ),
                ],
              )),
          Expanded(
              flex: 50,
              child: Row(
                children: [
                  const Spacer(
                    flex: 5,
                  ),
                  Expanded(
                      flex: 90,
                      child: Text(
                        bookApiModal.items![0].volumeInfo!.description!,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 14),
                      )),
                  const Spacer(
                    flex: 5,
                  )
                ],
              )),
          const Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }
}

class ErrorStateWidget extends StatelessWidget {
  final String error;
  const ErrorStateWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Error Found $error",
      style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    );
  }
}
