import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      onPressed: (){},
      backgroundColor: Colors.pink.shade700,
      child: Icon(Icons.add,color: Colors.white,),
    );
  }
}
