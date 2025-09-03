import 'package:flutter/material.dart';

class SeeMoreText extends StatelessWidget {
  final String mainMessageText;
  final String seeMoreText;
  final int maxLines;
  final TextStyle parentWidgetStyle;
  final TextStyle dialogueWidgetStyle;
  final TextStyle seeMoreTextStyle;
  final double dialogueBorderRadius;
  final String alertDialogueCancelButtonText;
  final ButtonStyle alertDialogueCancelButtonStyle;
  final TextStyle alertDialogueCancelButtonTextStyle;

  const SeeMoreText({
    super.key,
    required this.mainMessageText,
    required this.seeMoreText,
    required this.maxLines,
    required this.parentWidgetStyle,
    required this.dialogueWidgetStyle,
    required this.seeMoreTextStyle,
    required this.dialogueBorderRadius,
    required this.alertDialogueCancelButtonText,
    required this.alertDialogueCancelButtonStyle,
    required this.alertDialogueCancelButtonTextStyle,
  });
  

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          final span = TextSpan(text: mainMessageText,style: parentWidgetStyle);
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
              Text(mainMessageText,style: parentWidgetStyle,maxLines: maxLines,overflow: TextOverflow.ellipsis,),
              if(isOverflow)...[
                GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(dialogueBorderRadius),),
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
                                      Text(mainMessageText, style: dialogueWidgetStyle)
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
                                style: alertDialogueCancelButtonStyle,
                                child: Text(alertDialogueCancelButtonText,style: alertDialogueCancelButtonTextStyle)
                            )
                          ],
                        ),
                    );
                  },
                  child: Text(seeMoreText,style: seeMoreTextStyle),
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





