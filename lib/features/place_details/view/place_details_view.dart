import 'package:flutter/material.dart';

class PlaceView extends StatelessWidget {
  static route(String title) => MaterialPageRoute(
        builder: (context) => PlaceView(title: title),
      );

  const PlaceView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
