import 'package:flutter/material.dart';
import 'package:inspiring_quotes/inspiring.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCeFJ4P-8WWJSuhBxbNL1qhe5mqIJvImpA', 
      appId: '1:345310089335:android:0bd46317b184f944b1f672', 
      messagingSenderId: '345310089335', 
      projectId: 'authfirebase-b9221'
      )
  );
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Inspiring(),
    );
  }
}
