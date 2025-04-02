import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = "";

  @override
  void initState() {
    super.initState();
    getPosition().then((Position myPos) {
      myPosition =
          'Latitude: ${myPos.latitude.toStringAsFixed(7)} Longitude: ${myPos.longitude.toStringAsFixed(7)}';
      setState(() {
        myPosition = myPosition.replaceAll('Latitude:', 'Latitude : ').replaceAll('Longitude:', ' Longitude : ');
      });
    }).catchError((error) {
      myPosition = error.toString().replaceAll('-Heni RA-', '');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget myWidget = myPosition.isEmpty
        ? const CircularProgressIndicator()
        : Text(
            myPosition,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          );

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
        child: myWidget,
      ),
    );
  }

  Future<Position> getPosition() async {
    await Future.delayed(const Duration(seconds: 3)); // Tambahkan delay 3 detik
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied -Heni RA-');
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request them -Heni RA-');
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled -Heni RA-');
    }

    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }
}