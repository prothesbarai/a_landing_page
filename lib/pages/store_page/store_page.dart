import 'package:flutter/material.dart';
import '../../widgets/custom_app_bottom_bar.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_floating_button.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(pageTitle: "Store Page",),
      bottomNavigationBar: CustomAppBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingButton(),
    );
  }
}
