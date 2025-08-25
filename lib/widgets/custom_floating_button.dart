import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      onPressed: (){},
      backgroundColor: Colors.pink,
      child: Icon(Icons.add,color: Colors.white,),
    );
  }
}
