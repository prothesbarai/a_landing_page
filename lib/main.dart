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
        appBarTheme: AppBarThemeData(backgroundColor: Colors.pinkAccent,iconTheme: IconThemeData(color: Colors.white),centerTitle: true,),
        drawerTheme: DrawerThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight:Radius.circular(20), ),)),
        useMaterial3: false,
      ),
      home: SplashScreen(),
    );
  }
}

