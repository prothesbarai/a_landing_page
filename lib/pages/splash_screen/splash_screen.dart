import 'package:a_landing_page/pages/landing_page/landing_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      if(mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LandingPage(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/icon/logo.png"),
            ),
            SizedBox(height: 20,),
            Text("A Landing Page",style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold),)

          ],
        ),
      ),
    );
  }
}
