import 'package:flutter/material.dart';

import '../utils/app_colors.dart';


class CustomAppBottomBar extends StatelessWidget {
  const CustomAppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColor.primaryColor,
      notchMargin: 8,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomItems(context, Icons.account_balance, "Account"),
          _buildBottomItems(context, Icons.account_balance, "Account"),
          SizedBox(width: 40,),
          _buildBottomItems(context, Icons.account_balance, "Account"),
          _buildBottomItems(context, Icons.account_balance, "Account"),
        ],
      ),
    );
  }
  
  
  Widget _buildBottomItems(BuildContext context,IconData icon,String title){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 8,),
        Icon(icon,color: Colors.white,),
        Text(title,style: TextStyle(color: Colors.white),),
        SizedBox(height: 8,),
      ],
    );
  }
}
