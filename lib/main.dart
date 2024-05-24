import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:trainingapp/routes.dart';
import 'package:trainingapp/screens/loading/loading.dart';
import 'package:trainingapp/screens/master/master.dart';
import 'package:trainingapp/theme.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

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
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text("Error initializing the app"),
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            routes: appRoutes,
            theme: appTheme,
            home: MasterScreen(),
          );
        } else {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: LoadingScreen()
              ),
            ),
          );
        }


      }
    );
  }
}

