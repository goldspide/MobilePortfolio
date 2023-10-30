import 'package:flutter/material.dart';

class infoCart extends StatelessWidget {
  const infoCart({
    super.key,
    required this.nom,
    required this.profession,
  });
  final String nom, profession;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          Icons.person_2,
          color: Colors.white,
        ),
      ),
      title: Text(
        nom,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        profession,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
