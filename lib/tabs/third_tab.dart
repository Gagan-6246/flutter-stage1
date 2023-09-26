import 'package:flutter/material.dart';

class Third_tab extends StatefulWidget {
  const Third_tab({super.key});

  @override
  State<Third_tab> createState() => _Third_tabState();
}

class _Third_tabState extends State<Third_tab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('3rd tab')),
    );
  }
}
