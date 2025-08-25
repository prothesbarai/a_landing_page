import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget{
  final String pageTitle;
  const CustomAppbar({super.key,required this.pageTitle});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.pageTitle),
      actions: [IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],
    );
  }
}
