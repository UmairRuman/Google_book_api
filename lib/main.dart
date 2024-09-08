import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_book_api/Providers/providers.dart';
import 'package:google_book_api/StateWidgets/screens.dart';
import 'package:google_book_api/States/bookInfoStates.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends ConsumerState<HomePage> {
  String? endPoint;
  TextEditingController? textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  void onClickFetch() {
    endPoint = textEditingController!.text;
    log("EndPoint = $endPoint");
    ref.watch(bookInfoProvider.notifier).fetchBookInfo(endPoint: endPoint!);
    log("Clicked On button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 300,
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(

                    // fillColor: Colors.brown.shade200,
                    // filled: true,
                    label: Text(
                      "Enter Book Name",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 14,
                          fontStyle: FontStyle.italic),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3,
                            color: Colors.white,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(25)))),
              ),
            ),
            const BookInfoDataWidget(),
            BookInfoFetchButton(
              onClickfetchButton: onClickFetch,
            )
          ],
        ),
      ),
    );
  }
}

class BookInfoFetchButton extends ConsumerWidget {
  VoidCallback onClickfetchButton;
  BookInfoFetchButton({super.key, required this.onClickfetchButton});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 200,
      child: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: onClickfetchButton,
        child: const Text("Fetch Info"),
      ),
    );
  }
}

class BookInfoDataWidget extends ConsumerWidget {
  const BookInfoDataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(bookInfoProvider);
    if (state is BookInfoIntialState) {
      return const IntialStateWidget();
    } else if (state is BookInfoLoadingState) {
      return const LoadingStateWidget();
    } else if (state is BookInfoLoadedState) {
      return LoadedStateWidget(bookApiModal: state.bookInfo);
    } else {
      return ErrorStateWidget(error: (state as BookInfoErrorState).error);
    }
  }
}
