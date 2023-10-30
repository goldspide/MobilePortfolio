import 'package:flutter/material.dart';

class homrcreen extends StatefulWidget {
  const homrcreen({super.key});

  @override
  State<homrcreen> createState() => _homrcreenState();
}

class _homrcreenState extends State<homrcreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.cyanAccent,
      body: Text("ui"),
    );
  }
}
