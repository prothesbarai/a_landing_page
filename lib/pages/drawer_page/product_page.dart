import 'package:a_landing_page/widgets/custom_app_bottom_bar.dart';
import 'package:a_landing_page/widgets/custom_appbar.dart';
import 'package:a_landing_page/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppbar(pageTitle: "Product Page"),
      bottomNavigationBar: CustomAppBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingButton(),

    );
  }
}
