import 'package:flutter/material.dart';

class Kar extends StatelessWidget {
  const Kar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/kar.png'))),
      )),
    );
  }
}
