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
          'Latitude: ${myPos.latitude.toString()} Longitude: ${myPos.longitude.toString()}';
      setState(() {
        myPosition = myPosition;
      });
    });
  }

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
      backgroundColor: Colors.grey[300], // Warna background utama abu-abu terang
      body: Center(
        child: Text(
          myPosition,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black87, // Warna teks koordinat
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future<Position> getPosition() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Handle denied permission
      return Future.error('Location permissions are denied -Heni RA-');
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle permanently denied permission
      return Future.error('Location permissions are permanently denied, we cannot request them -Heni RA-');
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Handle disabled location service
      return Future.error('Location services are disabled -Heni RA-');
    }

    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }
}