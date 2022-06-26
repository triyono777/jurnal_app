import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBK0ACS32HtXGi_kMmP7vpaUnHs3JP-qik",
          authDomain: "projek-ea459.firebaseapp.com",
          projectId: "projek-ea459",
          storageBucket: "projek-ea459.appspot.com",
          messagingSenderId: "1025300124292",
          appId: "1:1025300124292:web:b105588b0b01a363f228d1",
          measurementId: "G-62GNLZWL05"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnal App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
