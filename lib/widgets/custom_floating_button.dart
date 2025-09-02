import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      onPressed: (){},
      backgroundColor: AppColor.primaryColor,
      child: Icon(Icons.add,color: Colors.white,),
    );
  }
}
