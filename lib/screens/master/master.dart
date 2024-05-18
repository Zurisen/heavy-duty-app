import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:trainingapp/screens/master/exercises/exercises.dart';
import 'package:trainingapp/screens/master/home/home.dart';
import 'package:trainingapp/screens/master/templates/templates.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MasterNavigationBar(),
      appBar: AppBar(),
    );
  }
}

class MasterNavigationBar extends StatefulWidget {
  const MasterNavigationBar({super.key});

  @override
  State<MasterNavigationBar> createState() => _MasterNavigationBarState();
}

class _MasterNavigationBarState extends State<MasterNavigationBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget> [
          NavigationDestination(
            icon: Icon(Ionicons.home_outline),
            selectedIcon: Icon(Ionicons.home_sharp),
            label: 'Home'
          ),
          NavigationDestination(
            icon: Icon(Ionicons.folder_outline),
            selectedIcon: Icon(Ionicons.folder),
            label: 'Templates'
          ),
          NavigationDestination(
            icon: Icon(Ionicons.albums_outline),
            selectedIcon: Icon(Ionicons.albums),
            label: 'Exercises')
        ],
      ),
      body: <Widget>[
        HomeScreen(),
        TemplatesScreen(),
        ExercisesScreen()
      ][currentPageIndex],
    );
  }
}