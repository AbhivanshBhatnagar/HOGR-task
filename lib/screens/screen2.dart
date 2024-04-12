import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({
    super.key,
  });

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Allow navigation to Screen3 within the current navigator
            Navigator.of(context).pushNamed('/screen3');
          },
          child: Text("Go to Page 3"),
        ),
      ),
    );
  }
}
