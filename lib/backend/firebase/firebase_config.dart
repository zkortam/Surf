import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC24-X4Yyc--R8HEQGumivNuudt1LpkCtU",
            authDomain: "surfappofficial.firebaseapp.com",
            projectId: "surfappofficial",
            storageBucket: "surfappofficial.appspot.com",
            messagingSenderId: "577071998373",
            appId: "1:577071998373:web:c1bdd7ca4ba23c2b5f344c",
            measurementId: "G-REJE9P30RN"));
  } else {
    await Firebase.initializeApp();
  }
}
