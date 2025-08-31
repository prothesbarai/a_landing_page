import 'package:flutter/material.dart';

class MembershipPage extends StatelessWidget {
  const MembershipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 280,
        margin: const EdgeInsets.only(top: 16,),
        child: Stack(
          children: [
            // Right side triangle background
            Align(
              alignment: Alignment.centerRight,
              child: ClipPath(
                clipper: TopRightTriangleClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: double.infinity,
                  color: Colors.pink.shade700,
                ),
              ),
            ),

            // Foreground content (text + button + image)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  // Left side texts
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Save 220,040+ TK yearly\non Baby Care, Beauty, Pet Care, Grocery & more!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text("Become a Member Now"),
                        ),
                      ],
                    ),
                  ),

                  // Right side image
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      "assets/images/motherchild.png",
                      height: 280,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}



class TopRightTriangleClipper extends CustomClipper<Path> {
  final double borderRadius;
  TopRightTriangleClipper({this.borderRadius = 50.0});

  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.moveTo(size.width, size.height);
    path.lineTo(size.width * 0.3 + borderRadius, size.height);
    path.quadraticBezierTo(size.width * 0.3, size.height, size.width * 0.3, size.height - borderRadius,);

    path.lineTo(size.width - borderRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius,);
    path.lineTo(size.width, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}








