// ignore: file_names
import 'package:flutter/material.dart';
import 'package:folio/Home/opt_ecran.dart';

// ignore: camel_case_types
class Titre_Menu extends StatelessWidget {
  const Titre_Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(color: Color.fromARGB(255, 254, 177, 83),height: 2,),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24,),
              child: Divider(
                color: Color.fromARGB(230, 243, 161, 10),
                height: 1,
                
              ),
            ),
           opt_ecran(img: "Accueil", title: ""),
           opt_ecran(img: "Projets", title:""),
           opt_ecran(img: "Statistique", title:""),
           opt_ecran(img: "Inscription complete", title: ""),
           
           Padding(
                padding: EdgeInsets.only(left: 24,top: 32,bottom: 16),
                child: Text(
                  "PARAMETTRES SYSTEMES",
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                 ),
                 ),
                 
           opt_ecran(img: "Parametres de compte", title: ""),
           opt_ecran(img: "Changé de thème", title: ""),
           opt_ecran(img: "A propos de AfCash", title:""),
           opt_ecran(img: "Se déconnecter", title: ""),
           
          ],
        ),
        
      ],
    );
  }
}
