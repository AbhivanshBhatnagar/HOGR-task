import 'package:flutter/material.dart';

import 'package:hogr_task/app.dart';

class Tab3Screen extends StatelessWidget {
  final void Function(int) callback;

  const Tab3Screen({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            callback(1);
          },
          child: Text("Go to Tab 2"),
        ),
      ),
    );
  }
}
