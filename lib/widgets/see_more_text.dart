import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SeeMoreText extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextStyle parentWidgetStyle;
  final TextStyle dialogueWidgetStyle;
  const SeeMoreText({
    super.key,
    required this.text,
    required this.maxLines,
    required this.parentWidgetStyle,
    required this.dialogueWidgetStyle,
  });
  

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          final span = TextSpan(text: text,style: parentWidgetStyle);
          final tp = TextPainter(
            text: span,
            maxLines: maxLines,
            textDirection: TextDirection.ltr
          )..layout(maxWidth: constraints.maxWidth);
          
          final isOverflow =  tp.didExceedMaxLines;
          
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text,style: parentWidgetStyle,maxLines: maxLines,overflow: TextOverflow.ellipsis,),
              if(isOverflow)...[
                GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                          contentPadding: EdgeInsets.zero,
                          content: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(text, style: dialogueWidgetStyle)
                                    ],
                                  ),
                                ),
                              ),
                              closeButton(context),
                            ],
                          ),

                          actions: [
                            ElevatedButton(
                                onPressed: (){Navigator.pop(context);},
                                style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),), padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),),
                                child: Text("Ok",style: TextStyle(color: Colors.white),)
                            )
                          ],
                        ),
                    );
                  },
                  child: Text("See more",style: TextStyle(color: Colors.black),),
                )
              ]
            ],
            
          );
          
        },
    );
  }
}


Widget closeButton(BuildContext context) {
  return Positioned(
    right: 5,
    top: 5,
    child: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,border: Border.all(color: Colors.red,width: 1)),
        padding: EdgeInsets.all(3),
        child: Icon(Icons.close, color: Colors.red, size: 20),
      ),
    ),
  );
}





