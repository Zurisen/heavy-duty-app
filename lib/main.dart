import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trainingapp/routes.dart';
import 'package:trainingapp/screens/loading/loading.dart';
import 'package:trainingapp/theme.dart';


void main() {
  
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError){
          return Text("Error initializing the app");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            routes: appRoutes,
            theme: appTheme,
          );
        } else {
          return LoadingScreen();
        }


      }
    );
  }
}

