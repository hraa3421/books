import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = const Color.fromARGB(255, 143, 1, 143);

  Future<void> _showColorDialog(BuildContext context) async {
    final selectedColor = await showDialog<Color>(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        Color? tempColor;
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Tosca'),
              onPressed: () {
                tempColor = const Color.fromARGB(255, 47, 184, 211);
                Navigator.pop(context, tempColor);
              },
            ),
            TextButton(
              child: const Text("Sage"),
              onPressed: () {
                tempColor = const Color.fromARGB(255, 13, 227, 166);
                Navigator.pop(context, tempColor);
              },
            ),
            TextButton(
              child: const Text('Navy'),
              onPressed: () {
                tempColor = const Color.fromARGB(255, 10, 83, 155);
                Navigator.pop(context, tempColor);
              },
            ),
          ],
        );
      },
    );

    if (selectedColor != null) {
      setState(() {
        color = selectedColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Change Color"),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }
}