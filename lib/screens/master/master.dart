import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:trainingapp/screens/loading/loading.dart';
import 'package:trainingapp/screens/login/login.dart';
import 'package:trainingapp/screens/master/exercises/exercises.dart';
import 'package:trainingapp/screens/master/home/home.dart';
import 'package:trainingapp/screens/master/templates/templates.dart';
import 'package:trainingapp/services/auth.dart';


class MasterScreen extends StatelessWidget {
  const MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const LoadingScreen();
        } else if (snapshot.hasError){
          return Center(child: const Text('Could not establish connection to the server'));
        } else if (snapshot.hasData){
          return MasterScreenScaffold();
        } else {
          return LoginScreen();
        }
      }
    );
  }
}






class MasterScreenScaffold extends StatefulWidget {
  const MasterScreenScaffold({super.key});

  @override
  State<MasterScreenScaffold> createState() => _MasterScreenScaffoldState();
}

class _MasterScreenScaffoldState extends State<MasterScreenScaffold> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              }, 
              icon: const Icon(Ionicons.person_circle_outline, size: 30,)
            );
          },
        )
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Text("Heavy Duty App"),
            )
          ],
        ),
      ),
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