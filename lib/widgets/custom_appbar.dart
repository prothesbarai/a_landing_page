import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget{
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Landing Page"),
      actions: [IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],
    );
  }
}
