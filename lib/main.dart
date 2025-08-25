import 'package:a_landing_page/pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: AppBarThemeData(backgroundColor: Colors.pinkAccent,iconTheme: IconThemeData(color: Colors.white),centerTitle: true,),
        drawerTheme: DrawerThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(20)))),
      ),
      home: SplashScreen(),
    );
  }
}

