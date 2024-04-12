import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Only allow navigation to Screen2 within Tab 1 navigator
            Navigator.of(context).pushNamed('/screen2');
          },
          child: Text("Go to Page 2 (Tab 1)"),
        ),
      ),
    );
  }
}
