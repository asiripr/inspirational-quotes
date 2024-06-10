import 'package:flutter/material.dart';
import 'package:inspiring_quotes/inspiring.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: '', 
      appId: '', 
      messagingSenderId: '', 
      projectId: ''
      )
  );
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inspiring(),
    );
  }
}
