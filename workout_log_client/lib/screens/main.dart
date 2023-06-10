import 'package:flutter/material.dart';
import 'package:workout_log/screens/dashboard/dashboard.dart';
import 'package:workout_log/themes/theme_constants.dart';
import '../themes/theme_manager.dart';
import '../widgets/page/nav_bar.dart';
import 'dart:io';

void main() {
  //DEVELOPMENT ONLY - REPLACE THIS IF GOING INTO PRODUCTION
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Log',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          //scaffoldBackgroundColor: const Color(0xff191923),
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              headline2: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              bodyText1: TextStyle(fontSize: 16.0))
          //.apply(bodyColor: Colors.white, displayColor: Colors.white)
          ),
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: const Main(title: 'Workout Log'),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Dashboard(title: 'Workout Log'),
        bottomNavigationBar: NavBar(currentPage: 0));
  }
}

//DEVELOPMENT ONLY - REPLACE THIS IF GOING INTO PRODUCTION
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
