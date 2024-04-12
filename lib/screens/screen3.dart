import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen3 extends StatefulWidget {
  final bool cross;
  const Screen3({super.key, required this.cross});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: widget.cross
            ? IconButton(
                icon: Icon(Icons.book_sharp),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : IconButton(
                icon: Icon(Icons.back_hand),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
        title: Text('Page 3'),
      ),
      body: FutureBuilder(
        future: loadJsonData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final items = (snapshot.data as List<dynamic>).cast<String>();
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data.'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Future<List<dynamic>> loadJsonData() async {
  final String jsonString = await rootBundle.loadString('assets/page3.json');
  final jsonData = json.decode(jsonString);
  return jsonData['page3'].cast<String>();
}
