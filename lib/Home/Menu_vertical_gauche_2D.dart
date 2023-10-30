// ignore: file_names
import 'dart:async';
// import 'dart:js_util';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:folio/main.dart';
import 'package:folio/Home/Menu_Option.dart';
import 'package:rxdart/rxdart.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedScream;
  late StreamSink<bool> isSidebarOpenedSink;
  // ignore: non_constant_identifier_names
  final _animation_Duration = const Duration(milliseconds: 500);

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: _animation_Duration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedScream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompled = animationStatus == AnimationStatus.completed;

    if (isAnimationCompled) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final Screenwidh = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedScream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          // vertical
          duration: _animation_Duration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data! ? 0 : -Screenwidh,
          right: isSideBarOpenedAsync.data! ? 0 : Screenwidh - 37,
          child: SingleChildScrollView(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: Color.fromARGB(255, 37, 37, 38),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 180,
                        ),
                        Column(
                          children: [
                            AnimatedTextKit(animatedTexts: [
                              TyperAnimatedText("Salut...!",
                              speed: Duration(milliseconds: 150),
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                              ),
                            ],
                            isRepeatingAnimation: true,
                            repeatForever: true,
                            displayFullTextOnTap: true,
                            stopPauseOnTap: false,
                            ),
                
                            Container(
                              child: const ListTile(
                                title: Text(
                                  "Mboning Wom's",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                subtitle: Text(
                                  "Rovanolwomo@ganil.com",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                leading: CircleAvatar(
                                  radius: 20,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 64,
                          thickness: 1,
                          color: Color.fromARGB(223, 87, 86, 83),
                          indent: 32,
                          endIndent: 32,
                        ),
                        // Menu_Option
                        const Padding(
                          padding: EdgeInsets.only(left: 24, top: 5, bottom: 5),
                          child: Text(
                            "NAVIGATION",
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          ),
                        ),
                        Menu_Option(
                          icon: Icons.home,
                          title: "Accueil",
                          onTap: () {
                            onIconPressed();
                          },
                        ),
                        Menu_Option(
                          icon: Icons.document_scanner_outlined,
                          title: "Projets",
                          onTap: () {},
                        ),
                        Menu_Option(
                          icon: Icons.trending_up_outlined,
                          title: "Statistique",
                          onTap: () {},
                        ),
                        Menu_Option(
                          icon: Icons.inbox,
                          title: "Inscription Complete",
                          onTap: () {},
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 24, top: 32, bottom: 16),
                          child: Text(
                            "PARAMETTRES SYSTEMES",
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          ),
                        ),
                        Menu_Option(
                          icon: Icons.settings,
                          title: "Paramétres de Compte",
                          onTap: () {},
                        ),
                        Menu_Option(
                          icon: Icons.mobile_friendly,
                          title: "Changé de thème",
                          onTap: () {},
                        ),
                        Menu_Option(
                          icon: Icons.groups_rounded,
                          title: "A pros de AfCash",
                          onTap: () {},
                        ),
                        Menu_Option(
                          icon: Icons.exit_to_app,
                          title: "Se déconnecter",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                // overture/fermeture
                Align(
                  alignment: const Alignment(0, -2),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: ClipPath(
                      // clipper: Menu_customiser(),
                      child: SizedBox(
                        height: 60,
                        child: Container(
                          width: 29,
                          height: 57,
                          // decoration: BoxDecoration(color:Colors.amber, borderRadius: BorderRadius.circular(5),),
                          color: Color.fromARGB(255, 37, 37, 38),
                          alignment: Alignment.centerLeft,
                          child: AnimatedIcon(
                            progress: _animationController.view,
                            icon: AnimatedIcons.menu_close,
                            color: Color.fromARGB(255, 213, 60, 60),
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
//  forme circulaire du bouton open/close_Menu
// class Menu_customiser extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Paint paint = Paint();
//     paint.color = Colors.white;

//     final Width = size.width;
//     final height = size.height;

//     Path path = Path();
//     path.moveTo(0, 0);
//     path.quadraticBezierTo(0, 8, 10, 16);
//     path.quadraticBezierTo(Width - 1, height / 2 - 20, Width, height / 2);
//     path.quadraticBezierTo(Width + 1, height / 2 + 20, 10, height -16);
//     path.quadraticBezierTo(0, Width - 8, 0, height);
//     path.close();
//     return Path();
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     return true;
//   }
// }

// class Menu_customiser extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//     // TODO: implement getClip
//     throw UnimplementedError();
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     throw true;
//   }
  
// }
