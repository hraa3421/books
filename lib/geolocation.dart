import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = "";
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  // getPosition()
  //     .then((Position myPos) {
  //   myPosition =
  //       'Latitude: ${myPos.latitude.toStringAsFixed(7)} Longitude: ${myPos.longitude.toStringAsFixed(7)}';
  //   setState(() {
  //     myPosition = myPosition
  //         .replaceAll('Latitude:', 'Latitude : ')
  //         .replaceAll('Longitude:', ' Longitude : ');
  //   });
  // })
  //     .catchError((error) {
  //   myPosition = error.toString().replaceAll('-Heni RA-', '');
  //   setState(() {});
  // });

  // @override
  // Widget build(BuildContext context) {
  //   final Widget myWidget =
  //       myPosition.isEmpty
  //           ? const CircularProgressIndicator()
  //           : Text(
  //               myPosition,
  //               style: const TextStyle(fontSize: 16.0, color: Colors.black87),
  //               textAlign: TextAlign.center,
  //             );
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text(
  //         'Current Location -Heni RA-',
  //         style: TextStyle(color: Colors.white),
  //       ),
  //       backgroundColor: Colors.blue,
  //     ),
  //     backgroundColor: Colors.grey[300],
  //     body: Center(child: myWidget),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Current Location -Heni RA-',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: FutureBuilder<Position>(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Text('No data available');
              }
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }

  Future<Position> getPosition() async {
    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3));
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}