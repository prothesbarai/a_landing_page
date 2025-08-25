import 'package:a_landing_page/widgets/custom_appbar.dart';
import 'package:a_landing_page/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      drawer: CustomDrawer(),
    );
  }
}
