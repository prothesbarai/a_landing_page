import 'package:flutter/material.dart';
import '../../widgets/custom_app_bottom_bar.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_floating_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppbar(pageTitle: "Profile Page"),
      bottomNavigationBar: CustomAppBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingButton(),

    );
  }
}
