import 'dart:async';
import 'package:books/geolocation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heni Rizki Amalia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LocationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  late Completer<int> completer; // Inisialisasi Completer di sini

  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/3ixIDwAAQBAJ';
    final url = Uri.https(authority, path);
    return http.get(url);
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future<void> count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  Future<int> getNumber() {
    completer = Completer<int>();
    _calculate(); // Panggil _calculate yang benar
    return completer.future;
  }

  Future<void> _calculate() async {
    // Ganti nama menjadi _calculate dan kembalikan void
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (e) {
      // Tangkap error yang mungkin terjadi
      completer.completeError(e); // Teruskan error ke Completer
    }
  }

  Future<void> handleError() async {
    try {
      await returnError();
    } catch (error) {
      setState(() {
        result = error.toString();
      });
    } finally {
      print('complete');
    }
  }

  Future<void> returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw ('Something terrible happened!');
  }

  // void returnFG() {
  //   FutureGroup<int> futureGroup = FutureGroup<int>();
  //   futureGroup.add(returnOneAsync());
  //   futureGroup.add(returnTwoAsync());
  //   futureGroup.add(returnThreeAsync());
  //   futureGroup.close();
  //
  //   futureGroup.future.then((List<int> value) {
  //     int total = 0;
  //     for (var element in value) {
  //       total += element;
  //     }
  //     setState(() {
  //       result = total.toString();
  //     });
  //   });
  // }

  void returnFW() {
    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);

    futures.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Back from the Future',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('GO!'),
              onPressed: () {
                handleError(); // Panggil method handleError() saat tombol ditekan
              },
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}