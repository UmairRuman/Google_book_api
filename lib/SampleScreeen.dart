import 'package:flutter/material.dart';
import 'package:google_book_api/ApiServices/api_services.dart';
import 'package:google_book_api/ApiServices/book_api_modal.dart';

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  BookApiServices bookApiServices = BookApiServices();
  Future<BookApiModal>? future;
  @override
  void initState() {
    super.initState();
  }

  void onClick() {
    setState(() {
      future = bookApiServices.fetchBookData(endPoint: "Can't hurt me");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
            } else if (snapshot.connectionState == ConnectionState.none) {
              return const Text("Click to Fetch Data");
            } else if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.active) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text(snapshot.data!.totalItems.toString());
            }
            return const Text("No data Found");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onClick,
        child: const Icon(Icons.add),
      ),
    );
  }
}
