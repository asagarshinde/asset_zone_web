import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final Future<FirebaseApp> initialization = Firebase.initializeApp(
  options: const FirebaseOptions(
      apiKey: "AIzaSyBxh2B6H7ynAbIOCsHcqPndPN1e2ADRqfs",
      authDomain: "assets-zone.firebaseapp.com",
      projectId: "assets-zone",
      storageBucket: "assets-zone.appspot.com",
      messagingSenderId: "1001122158865",
      appId: "1:1001122158865:web:e458ae8a32388d4b2d54b0"),
);
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
