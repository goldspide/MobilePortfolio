import 'package:flutter/material.dart';

class opt_ecran extends StatelessWidget {
  const opt_ecran({
    super.key, 
    required this.img, 
    required this.title,
  });
  final String img, title;
 
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        img, 
        style: const TextStyle(color:Colors.white),),
      subtitle: Text(
        title, 
        style: const TextStyle(color: Colors.white),
        ),
      );
      
  }
}