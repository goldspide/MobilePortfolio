import 'package:flutter/material.dart';
import 'package:folio/Home/Menu_modal.dart';
import 'package:folio/Home/Menu_vertical_gauche_2D.dart';
import 'package:folio/Home/page/myaccont.dart';
import 'package:folio/Navigation/Menu_vertical_gauche_3D.dart';

class sideBarLayout extends StatelessWidget {
  const sideBarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget> [
            // Myaccontpage(),
            // SideBar(),
            // MenuDashboardPage(),
            MyCustomUI()
        ],
      ),
    );
     
  }
}