// // import 'dart:html';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthService{
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   // connexion avec google

//   Future<UserCredential> signInwithGoogle() async{
//     // Declencher le flux d'authentification
//     final googleUser = await _googleSignIn.signIn();
//     // final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//     //  obtenir les details d'authentification de la demande

//     final googleAuth = await googleUser!.authentication;

//     //  creation d'un nouvel identifiant

//    final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//    );
    
//     //  Une fois connecte,nrenvoyer l'identifiant de l'utilisateur

//     return await _auth.signInWithCredential(credential);
//   }

//   // l'etat de l'utilicateur en temps reel
//   Stream<User?> get user => _auth.authStateChanges();
  
// }