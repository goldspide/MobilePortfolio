import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:folio/Home/Menu_Option.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 37, 38),
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              child: Container(
                // padding: const EdgeInsets.symmetric(horizontal: 10),
                      color: Color.fromARGB(255, 37, 37, 38),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 180,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100),
                                    child: AnimatedTextKit(animatedTexts: [
                                    TyperAnimatedText("Salut...!",
                                    speed: Duration(milliseconds: 300),
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )
                                    ),
                                ],
                                  isRepeatingAnimation: true,
                                  repeatForever: false,
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: false,
                                ),
                              ),
                            ],
                          ),
                              const ListTile(
                                title: Text(
                                  "Mboning Wom's",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                subtitle: Text(
                                  "Rovanolwomo@ganil.com",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
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
                            padding: EdgeInsets.only(left: 1, top: 5, bottom: 5),
                            child: Text(
                              "NAVIGATION",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Menu_Option(
                            icon: Icons.home,
                            title: "Accueil",
                            onTap: () {},
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
                                EdgeInsets.only( top: 32, bottom: 16),
                            child: Text(
                              "PARAMETRES",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 10,
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
              
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          elevation: 8,
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: const Color.fromARGB(255, 14, 13, 13)),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      // Text("Acceuil", style: TextStyle(fontSize: 24, color: Colors.white)),
                      // Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.redAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.blueAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.greenAccent,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Transactions", style: TextStyle(color: const Color.fromARGB(255, 56, 56, 56), fontSize: 20),),
                  // ListView.separated(
                  //   shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //   return ListTile(
                  //     title: Text("Projet Sodocoton", style: TextStyle(color: Color.fromARGB(255, 127, 127, 127)),),
                  //     subtitle: Text("secteur 7"),
                  //     trailing: Text("100000"),
                  //   );
                  // }, separatorBuilder: (context, index) {
                  //   return Divider(height: 16);
                  // Column(
                  //   children: [
                  //     ListView(
                            
                            
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}