import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}


class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen -Heni RA-'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Tosca'),
              onPressed: () {
                color = const Color.fromARGB(255, 125, 193, 224);
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Green (sage)'),
              onPressed: () {
                color = const Color.fromARGB(255, 148, 194, 150);
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Navy'),
              onPressed: () {
                color = const Color.fromARGB(255, 2, 71, 140);
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}
