import 'package:a_landing_page/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class MembershipPage extends StatelessWidget {
  const MembershipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppbar(pageTitle: "Membership Page"),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 210,
              margin: const EdgeInsets.only(top: 16,),
              child: Stack(
                children: [
                  // Right side triangle background
                  Align(
                    alignment: Alignment.centerRight,
                    child: ClipPath(
                      clipper: TopRightTriangleClipper(),
                      child: Container(
                        width: 300,
                        height: 200,
                        color: Colors.pink.shade700,
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      // Left side texts
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Save 220,040+ TK yearly\non Baby Care, Beauty, Pet Care, Grocery & more!",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black, height: 1.4,),
                              ),
                              const SizedBox(height: 50),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                ),
                                child: const Text("Become a Member Now",style: TextStyle(fontSize: 14),),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Right side image
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: Image.asset("assets/images/motherchild.png", height: 200, fit: BoxFit.fill,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildSection(context, "Save UP TO 60,112 TK ON BABY CARE", "Become a member & buy every item at a wholesale rate", "assets/images/motherchild.png", false, Colors.pink.shade700,Colors.white,Colors.amber),
            _buildSection(context, "Save UP TO 60,112 TK ON BABY CARE", "Become a member & buy every item at a wholesale rate", "assets/images/motherchild.png", true, Colors.amber,Colors.pink.shade700,Colors.black),
             Container(color: Colors.pink.shade700,height: 5,),
            _buildSection(context, "Save UP TO 60,112 TK ON BABY CARE", "Become a member & buy every item at a wholesale rate", "assets/images/motherchild.png", false, Colors.white,Colors.pink.shade700,Colors.black),
            _buildSection(context, "Save UP TO 60,112 TK ON BABY CARE", "Become a member & buy every item at a wholesale rate", "assets/images/motherchild.png", true, Colors.pink.shade700,Colors.white,Colors.amber),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8.0),
              child: Text("Get Paikaree Membership Card Now",style: TextStyle(color: Colors.pink.shade700,fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            SizedBox(height: 90,)
          ],
        ),
      )
    );
  }
}


/// >>> =========== Top 4 Section Widget Build Start Here ===================
Widget _buildSection(BuildContext context, String title, String description, String imgUrl, bool reverse, Color bgColor,Color titleColor,Color desColor){
  return Container(
    height: 200,
    decoration: BoxDecoration(
      color: bgColor,
    ),
    child: Row(
      children: [

        reverse ? Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 2.0,top: 2.0),
            child: Image.asset(imgUrl, height: 200, fit: BoxFit.fill,),
          ),
        ): Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: titleColor, height: 1.4,),),
                SizedBox(height: 15,),
                Text(description, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: desColor, height: 1.4,),),
              ],
            ),
          ),
        ),

        reverse ? Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: titleColor, height: 1.4,),textAlign: TextAlign.right,),
                SizedBox(height: 15,),
                Text(description, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: desColor, height: 1.4,),textAlign: TextAlign.right,),
              ],
            ),
          ),
        ) : Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 2.0,top: 2.0),
            child: Image.asset(imgUrl, height: 200, fit: BoxFit.fill,),
          ),
        ),

      ],
    ),
  );
}
/// <<< =========== Top 4 Section Widget Build End Here ===================


/// >>>  Create Top Section Image BG shape
class TopRightTriangleClipper extends CustomClipper<Path> {
  final double borderRadius;
  TopRightTriangleClipper({this.borderRadius = 20.0});

  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.moveTo(size.width, size.height);
    path.lineTo(size.width * 0.3 + borderRadius, size.height);
    path.quadraticBezierTo(size.width * 0.3, size.height, size.width * 0.3, size.height - borderRadius,);

    path.lineTo(size.width + borderRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius,);
    path.lineTo(size.width, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}





