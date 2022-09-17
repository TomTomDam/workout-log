import 'package:flutter/material.dart';
import 'package:workout_log/screens/Dashboard.dart';
import 'screens/SelectWorkout.dart';
import 'screens/Programs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Log',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              bodyText1: TextStyle(fontSize: 16.0))),
      home: const Main(title: 'Workout Log'),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    void _onNavigationItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Main(title: 'Workout Log')));
          break;
        case 1:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const SelectWorkout()));
          break;
        case 3:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Programs()));
          break;
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: const Dashboard(title: 'Workout Log'),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bolt_rounded), label: "Workouts"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps_rounded), label: "Programs"),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: _onNavigationItemTapped));
  }
}
