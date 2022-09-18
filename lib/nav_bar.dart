import 'package:flutter/material.dart';
import '../main.dart';
import 'screens/select_workout.dart';
import 'screens/programs.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key, required this.currentPage}) : super(key: key);
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = currentPage;
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

    return BottomNavigationBar(
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
        onTap: _onNavigationItemTapped);
  }
}
