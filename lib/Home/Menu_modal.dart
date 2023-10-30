import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:folio/Navigation/Menu_vertical_gauche_3D.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCustomUI extends StatefulWidget {
  @override
  _MyCustomUIState createState() => _MyCustomUIState();
}

class _MyCustomUIState extends State<MyCustomUI> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  bool _bool = true;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _animation1 = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _bool = true;
        }
      });
    _animation2 = Tween<double>(begin: 0, end: .3).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animation3 = Tween<double>(begin: .9, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    // declaration du tab de page

    // int IndexPageCourrante = 0;
    // @override
    // final _Pages = <Widget>[
    //   Container(
    //     child: Icon(Icons.abc),

    //     ),
    // ];
    // final Button = 
    // assert (_Pages.length == );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          splashColor: Colors.transparent,
          onPressed: () {
            if (_bool == true) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            _bool = false;
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Stack(
        children: [
          // ALWAYS PLACE IT ON THE TOP OF EVERY WIDGET...
          BackgroundImage(),

          // EVERYTHING SHOULD BE HERE...
          SizedBox(
            height: _height,
            width: _width,
            child: null,
          ),

          // ALWAYS PLACE IT ON THE BOTTOM OF EVERY WIDGET...
          CustomNavigationDrawer(),
        ],
      ),
    );
  }

  Widget CustomNavigationDrawer() {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaY: _animation1.value, sigmaX: _animation1.value),
      child: Container(
        height: _bool ? 0 : _height,
        width: _bool ? 0 : _width,
        color: Colors.transparent,
        child: Center(
          child: Transform.scale(
            scale: _animation3.value,
            child: Container(
              width: _width * .9,
              height: _width * 1.7, //tail de la modal a l'ouverture
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_animation2.value),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 35,
                    child: Icon(
                      Icons.person_outline_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Container(
                      child: const ListTile(
                        title: Text(
                          "Mboning Wom's",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        subtitle: Text(
                          "Rovanolwomo@ganil.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 2,
                    ),
                    child: Text(
                      "NAVIGATION",
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      MyTile(Icons.home, 'Accueil', () {
                        // HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'En Maintenance',
                        );
                      }),
                      MyTile(Icons.document_scanner_rounded, 'Projets', () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'En Maintenance',
                        );
                      }),
                      MyTile(Icons.trending_up_rounded, 'Statistiques', () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'En Maintenance',
                        );
                      }),
                      MyTile(Icons.inbox, 'Inscription Compléte', () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'En Maintenance',
                        );
                      }),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 2,
                        ),
                        child: Text(
                          "PARAMETTRES SYSTEMES",
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                      ),
                      MyTile(Icons.settings, 'Paramétres de Compte', () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'En Maintenance',
                        );
                      }),
                      MyTile(Icons.dark_mode, 'Changé de thème', () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'En Maintenance',
                        );
                      }),
                      MyTile(Icons.info_outline_rounded, 'A pros de AfCash',
                          () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'En Maintenance',
                        );
                      }),
                      MyTile(Icons.exit_to_app, 'Se déconnecter', () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'En Maintenance',
                        );
                      }),
                    ],
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget BackgroundImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      // child: Image.asset(
      //   'assets/images/background_image.png',
      //   fit: BoxFit.fitHeight,
      // ),
      child: Container(
        color: Colors.black,
      ),
    );
  }

  Widget MyTile(
    IconData icon,
    String title,
    VoidCallback voidCallback,
  ) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.black.withOpacity(.08),
          leading: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          onTap: voidCallback,
          title: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          trailing: Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
        ),
        divider()
      ],
    );
  }

  Widget divider() {
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
    );
  }
}
