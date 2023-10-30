import 'package:flutter/material.dart';
import 'package:folio/Home/MenuBtn.dart';
import 'package:folio/Home/interface.dart';
import 'package:folio/acceuil.dart';

import 'Menu_aide.dart';
import 'infoCart.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(182, 1, 37, 108),
      body: Stack(
        // fermeture et ouverture
        children: [
          Positioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            child: ecran(),
            ),
          Transform.translate(
            offset: Offset(0, 0),
            child: Transform.scale(
              scale: 1,
              child: ecran(),
              ),
            ),
            const MenuBtn(),
        ],
      ),
    );
  }
}

class ecran extends StatelessWidget {
  const ecran({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: double.infinity,
      color: Color.fromARGB(182, 1, 26, 108),
      child: const SafeArea(
        child: Column(
          children: [
            infoCart(
              nom: "Mboning",
              profession: "Dev_Mobile",
            ),
            Padding(
              padding: EdgeInsets.only(left: 24,top: 32,bottom: 16),
              child: Text(
                "NAVIGATION",
                style: TextStyle(
                  color: Colors.white54,
                ),
              ),
            ),
            
            // bouton
            Titre_Menu(),
          ],
        ),
      ),
      );
  }
}

