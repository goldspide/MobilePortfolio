
import 'package:flutter/material.dart';
import 'package:folio/Home/Home1.dart';
import 'package:folio/Home/Menu_vertical_gauche_2D.dart';
import 'package:folio/Home/home.dart';
import 'package:folio/Services/Authentification.dart';

import 'Home/Menu_aide.dart';


// ignore: camel_case_types
class authentification extends StatefulWidget {
  const authentification({super.key});

  @override
  State<authentification> createState() => _authentificationState();
}

// ignore: camel_case_types
class _authentificationState extends State<authentification> {
  bool inLoginProcess = false;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    "Bon retour parmis nous",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Entrez vos informations personnel pour vous identifier dans le system, vous pouvez egalemment choisir le mode de connection",
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Formulaire
                  SignForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// formulaire

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final email = TextEditingController();
  final passw = TextEditingController();


  @override
  dispose() {
    email.dispose();
    passw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool inLoginProcess = false;
    //  fonction onPressed du bouton Connexion avec
    //    signIn(){
    //     setState(() {
    //       inLoginProcess = true;
    //       AuthService().signInwithGoogle();

    //     });
    // }
    return Form(
        child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "AUTHENTIFICATION",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        // Email
        TextFormField(
          controller: email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email",
            suffixIcon: const Icon(Icons.mail_lock),
            //  hintText: "Votre Email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 42,
              vertical: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: Color.fromARGB(226, 84, 126, 240)),
              gapPadding: 10,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: Color.fromARGB(226, 84, 126, 240)),
              gapPadding: 10,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),

        // passeword
        TextFormField(
          controller: passw,
          // maxLength: 11,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Mot_Pass",
            suffixIcon: const Icon(Icons.remove_red_eye),
            //  hintText: "Votre Mot de Passe",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 42,
              vertical: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: Color.fromARGB(226, 84, 126, 240)),
              gapPadding: 10,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: Color.fromARGB(226, 84, 126, 240)),
              gapPadding: 10,
            ),
          ),
        ),

        // bouton
        const SizedBox( height: 55,),

        GestureDetector(
          child: ElevatedButton(
            onPressed:(){ 
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const sideBarLayout(), //ouverture de la next page
                        ),);
                      },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: const Color.fromARGB(190, 44, 4, 204),
              padding: const EdgeInsets.all(13),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Allons-y",
                ),
              ],
            ),
          ),
        ),

        const SizedBox(
          height: 15,
        ),
        inLoginProcess
        ? Center(child: CircularProgressIndicator() )
        :ElevatedButton(
                onPressed: () => (),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: const Color.fromARGB(253, 234, 164, 71),
                  padding: const EdgeInsets.all(13),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "CONNEXION AVEC",
                    ),
                  ],
                ),
              ),
      ],
    ));
  }

 
}


// TEST DU LOGIN

// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// // import '../constants.dart';

// // !NOTE: prefer the flutterfire_ui package, see [FlutterFireLoginUiExample].
// // NOTE: to add firebase support, first go to firebase console, generate the
// // firebase json file, and add configuration lines in the gradle files.
// // C.f. this commit: https://github.com/X-Wei/flutter_catalog/commit/48792cbc0de62fc47e0e9ba2cd3718117f4d73d1.
// class FirebaseLoginExample extends StatefulWidget {
//   const FirebaseLoginExample({super.key});

//   @override
//   _FirebaseLoginExampleState createState() => _FirebaseLoginExampleState();
// }

// class _FirebaseLoginExampleState extends State<FirebaseLoginExample> {
//   final _auth = firebase_auth.FirebaseAuth.instance;
//   firebase_auth.User? _user;
//   // If this._busy=true, the buttons are not clickable. This is to avoid
//   // clicking buttons while a previous onTap function is not finished.
//   bool _busy = false;
  
//   get kAnalytics => null;

//   @override
//   void initState() {
//     super.initState();
//     this._user = _auth.currentUser;
//     _auth.authStateChanges().listen((firebase_auth.User? usr) {
//       this._user = usr;
//       debugPrint('user=$_user');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final statusText = Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Text(
//         _user == null
//             ? 'You are not logged in.'
//             : 'You are logged in as "${_user!.displayName}".',
//       ),
//     );
//     final googleLoginBtn = MaterialButton(
//       color: Colors.blueAccent,
//       onPressed: this._busy
//           ? null
//           : () async {
//               setState(() => this._busy = true);
//               final user = await this._googleSignIn();
//               this._showUserProfilePage(user!);
//               setState(() => this._busy = false);
//             },
//       child: const Text('Log in with Google'),
//     );
//     final anonymousLoginBtn = MaterialButton(
//       color: Colors.deepOrange,
//       onPressed: this._busy
//           ? null
//           : () async {
//               setState(() => this._busy = true);
//               final user = await this._anonymousSignIn();
//               this._showUserProfilePage(user!);
//               setState(() => this._busy = false);
//             },
//       child: const Text('Log in anonymously'),
//     );
//     final signOutBtn = TextButton(
//       onPressed: this._busy
//           ? null
//           : () async {
//               setState(() => this._busy = true);
//               await this._signOut();
//               setState(() => this._busy = false);
//             },
//       child: const Text('Log out'),
//     );
//     return Center(
//       child: ListView(
//         padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 50.0),
//         children: <Widget>[
//           Text(
//               'NOTE: prefer the flutterfire_ui package, see `FlutterFireLoginUiExample`.'),
//           statusText,
//           googleLoginBtn,
//           anonymousLoginBtn,
//           signOutBtn,
//         ],
//       ),
//     );
//   }

//   // Sign in with Google.
//   Future<firebase_auth.User?> _googleSignIn() async {
//     final curUser = this._user ?? _auth.currentUser;
//     if (curUser != null && !curUser.isAnonymous) {
//       return curUser;
//     }
//     final googleUser = await GoogleSignIn().signIn();
//     final googleAuth = await googleUser!.authentication;
//     final credential = firebase_auth.GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     // Note: user.providerData[0].photoUrl == googleUser.photoUrl.
//     final user = (await _auth.signInWithCredential(credential)).user;
//     kAnalytics?.logLogin();
//     setState(() => this._user = user);
//     return user;
//   }

//   // Sign in Anonymously.
//   Future<firebase_auth.User?> _anonymousSignIn() async {
//     final curUser = this._user ?? _auth.currentUser;
//     if (curUser != null && curUser.isAnonymous) {
//       return curUser;
//     }
//     final anonyUser = (await _auth.signInAnonymously()).user;
//     await anonyUser!
//         .updateDisplayName('${anonyUser.uid.substring(0, 5)}_Guest');
//     await anonyUser.reload();
//     // Have to re-call `currentUser()` to make `updateProfile` work.
//     // Cf. https://stackoverflow.com/questions/50986191/flutter-firebase-auth-updateprofile-method-is-not-working.
//     final user = _auth.currentUser;
//     kAnalytics?.logLogin();
//     setState(() => this._user = user);
//     return user;
//   }

//   Future<void> _signOut() async {
//     final user = _auth.currentUser;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           user == null
//               ? 'No user logged in.'
//               : '"${user.displayName}" logged out.',
//         ),
//       ),
//     );
//     _auth.signOut();
//     setState(() => this._user = null);
//   }

//   // Show user's profile in a new screen.
//   void _showUserProfilePage(firebase_auth.User user) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (ctx) => Scaffold(
//           appBar: AppBar(
//             title: const Text('user profile'),
//           ),
//           body: ListView(
//             children: <Widget>[
//               ListTile(title: Text('User: $user')),
//               ListTile(title: Text('User id: ${user.uid}')),
//               ListTile(title: Text('Display name: ${user.displayName}')),
//               ListTile(title: Text('Anonymous: ${user.isAnonymous}')),
//               ListTile(title: Text('Email: ${user.email}')),
//               ListTile(
//                 title: const Text('Profile photo: '),
//                 trailing: user.photoURL != null
//                     ? CircleAvatar(
//                         backgroundImage: NetworkImage(user.photoURL!),
//                       )
//                     : CircleAvatar(
//                         child: Text(user.displayName![0]),
//                       ),
//               ),
//               ListTile(
//                 title: Text('Last sign in: ${user.metadata.lastSignInTime}'),
//               ),
//               ListTile(
//                 title: Text('Creation time: ${user.metadata.creationTime}'),
//               ),
//               ListTile(title: Text('ProviderData: ${user.providerData}')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

