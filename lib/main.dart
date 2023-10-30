import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:folio/Drawer1/Home.dart';
import 'package:folio/Navigation/Menu_vertical_gauche_3D.dart';
import 'Home/home.dart';
import 'acceuil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const MyHomePage(title: 'Cash'),
    return AdaptiveTheme(
        light:
            ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
        dark: ThemeData(
            brightness: Brightness.dark, primarySwatch: Colors.orange),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              title: 'Invest',
              theme: theme,
              darkTheme: darkTheme,
              home: const MyHomePage(title: 'Cash'),
            )
          );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Afri~Cash",
      home:acceuil(),
      // home: Home(),
      // home: MenuDashboardPage(),
    );
  }
}


// test

// import 'package:adaptive_theme/adaptive_theme.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//      return AdaptiveTheme(
//         light:
//             ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
//         dark: ThemeData(
//             brightness: Brightness.dark, primarySwatch: Colors.orange),
//         initial: AdaptiveThemeMode.light,
//         builder: (theme, darkTheme) => MaterialApp(
//               title: 'Invest',
//               theme: theme,
//               darkTheme: darkTheme,
//               // home: MyHomePage(title: 'Cash'),
//             )
//           );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   title: Text('Thème Mode'),
//       // ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Thème Mode',
//               style: Theme.of(context).textTheme.headline1,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                  AdaptiveTheme.of(context).setDark();
//               },
//               child: Text("ok"),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// test

// import 'package:flutter/material.dart';
// import 'package:folio/Drawer1/page1.dart';
// import 'package:folio/Drawer1/page2.dart';
// import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
// // import 'package:hidden_drawer_menu/model/hidden_drawer_menu.dart';
// import 'package:hidden_drawer_menu/simple_hidden_drawer/simple_hidden_drawer.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   get backgroundColorContent => null;

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SimpleHiddenDrawer(
//         menu: Menu(),
//         screenSelectedBuilder: (position,controller) {
          
//           Widget screenCurrent;
          
//           switch(position){
//             case 0 : screenCurrent = page1(); break;
//             case 1 : screenCurrent = page2(); break;
//             // case 2 : screenCurrent = Screen3(); break;
//           }
          
//           return Scaffold(
//             backgroundColor: backgroundColorContent,
//             appBar: AppBar(
//               leading: IconButton(
//                   icon: Icon(Icons.menu),
//                   onPressed: () {
//                     controller.toggle();
//                   }),
//             ),
//             body: screenCurrent,
//           );
          
//         },
//       ),
//     );
//   }
// }

// class Menu extends StatefulWidget {
//   @override
//   _SecondSreenState createState() => _MenuState();
// }

// class _MenuState extends State<SecondSreen> {

//   SimpleHiddenDrawerController controller;

//   @override
//   void didChangeDependencies() {
//     controller = SimpleHiddenDrawerController.of(context);
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       height: double.maxFinite,
//       color: Colors.cyan,
//       padding: const EdgeInsets.all(8.0),
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 controller.setSelectedMenuPosition(0);
//               },
//               child: Text("Menu 1"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 controller.setSelectedMenuPosition(1);
//               },
//               child: Text("Menu 2"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

