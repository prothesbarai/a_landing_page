import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String storePage;
  final Widget pageRoute;

  const SectionTitle({
    super.key,
    required this.title,
    required this.storePage,
    required this.pageRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: EdgeInsets.only(left: 14, right: 10, bottom: 14,top: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 0),
              child: TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoute),);},
                style: TextButton.styleFrom(padding: EdgeInsets.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap, minimumSize: Size(0, 0),),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(storePage, style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w400),),
                    SizedBox(width: 0),
                    Icon(Icons.chevron_right,color: Colors.black, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
