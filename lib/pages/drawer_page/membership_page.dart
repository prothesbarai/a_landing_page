import 'package:a_landing_page/pages/drawer_page/product_page.dart';
import 'package:a_landing_page/pages/drawer_page/profile_page.dart';
import 'package:a_landing_page/pages/utils/app_colors.dart';
import 'package:a_landing_page/widgets/custom_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MembershipPage extends StatelessWidget {
  const MembershipPage({super.key});



  @override
  Widget build(BuildContext context) {


    final List<Map<String, String>> plans = [
      {"fee": "1000 TK", "validity": "1 Year Validity"},
      {"fee": "600 TK", "validity": "6 Month Validity"},
      {"fee": "100 TK", "validity": "3 Days Validity"},
    ];





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
                      child: Container(width: 300, height: 200, color: AppColors.primaryColor,),
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
                              Text(
                                "Save 220,040+ TK yearly\non Baby Care, Beauty, Pet Care, Grocery & more!",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryColor, height: 1.4,),
                              ),
                              const SizedBox(height: 50),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.yellowAccent, foregroundColor: AppColors.primaryColor,
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

            _buildSection(context, "Save UP TO 60,112 TK ON BABY CARE", "Become a member & buy every item at a wholesale rate", "assets/images/motherchild.png", false, AppColors.primaryColor,Colors.white,AppColors.yellowAccent,ProductPage()),
            _buildSection(context, "Save UP TO 60,112 TK ON BABY CARE", "Become a member & buy every item at a wholesale rate", "assets/images/motherchild.png", true, AppColors.yellowAccent,AppColors.primaryColor,Colors.black,ProfilePage()),
             Container(color: AppColors.primaryColor,height: 6,),
            _buildSection(context, "Save UP TO 60,112 TK ON BABY CARE", "Become a member & buy every item at a wholesale rate", "assets/images/motherchild.png", false, Colors.white,AppColors.primaryColor,Colors.black,ProfilePage()),
            _buildSection(context, "Save UP TO 60,112 TK ON BABY CARE", "Become a member & buy every item at a wholesale rate", "assets/images/motherchild.png", true, AppColors.primaryColor,Colors.white,AppColors.yellowAccent,ProductPage()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8.0),
              child: Text("Get Paikaree Membership Card Now",style: TextStyle(color: AppColors.primaryColor,fontSize: 20, fontWeight: FontWeight.bold),),
            ),




            /// >>>  =============== Start MembershipCard Builder Section ==============================
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 2,
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  // First row in 1 items
                  if (index == 0) {
                    return memberShipCardDesignAndBuild(context, plans[0]['fee']!, plans[0]['validity']!,);
                  } else {
                    // Second row in 2 items
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: memberShipCardDesignAndBuild(context, plans[1]['fee']!, plans[1]['validity']!,),
                          ),
                        ),
                        SizedBox(width: 8.0,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: memberShipCardDesignAndBuild(context, plans[2]['fee']!,  plans[2]['validity']!,),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),

            /// <<<  =============== End MembershipCard Builder Section ================================







            /// >>> ======================= Carousel Section Start Here ================================
            SizedBox(
              height: 130,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 8.0, right: index == 7 ? 8.0 : 0.0,),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(color: Color(0xfff6f6f6), borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black.withValues(alpha: 0.1))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius : 35,
                              child: Icon(Icons.person,size: 60,),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("\"I saved over \$200 in 3 months!\"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 21),),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Smith.t",style: TextStyle(fontWeight: FontWeight.bold),),
                                      GestureDetector(
                                        onTap: () async {
                                          final Uri url = Uri.parse("https://www.youtube.com/watch?v=ic3XqDNHrHQ");
                                          // Try external app first
                                          try {
                                            await launchUrl(url, mode: LaunchMode.externalApplication,);
                                          } catch (_) {
                                            // Fallback: browser
                                            if (await canLaunchUrl(url)) {
                                              await launchUrl(url, mode: LaunchMode.platformDefault,);
                                            } else {
                                              if (kDebugMode) print("Could not launch $url");
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(color: Color(0xfff6f6f6), borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black.withValues(alpha: 0.1))),
                                          padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                                          child: Row(
                                            children: [
                                              Text("Click here"),
                                              SizedBox(width: 4,),
                                              Icon(Icons.play_arrow)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            /// <<< ======================= Carousel Section End Here ==================================



            SizedBox(height: 90,)
          ],
        ),
      )
    );
  }
}





/// >>>  ========== Create Top Section Image BG shape Start Here ===============
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
/// <<<  ========== Create Top Section Image BG shape End Here =================




/// >>> =========== Top 4 Section Widget Build Start Here ======================
Widget _buildSection(BuildContext context, String title, String description, String imgUrl, bool reverse, Color bgColor,Color titleColor,Color desColor, Widget navigatePage){
  return GestureDetector(
    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => navigatePage,)),
    child: Container(
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
    ),
  );
}
/// <<< =========== Top 4 Section Widget Build End Here ========================



/// >>>  =============== Start MembershipCard Design And Functional Section ==============================
Widget memberShipCardDesignAndBuild(BuildContext context ,String fee, String validity) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(color: Color(0xFFF7F0DB), border: Border.all(color: AppColors.primaryColor), borderRadius: BorderRadius.circular(12),),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Fee : $fee", style: TextStyle(fontSize: 16, color: AppColors.primaryColor)),
        SizedBox(height: 4),
        Text(validity, style: TextStyle(fontSize: 16, color: AppColors.primaryColor)),
        SizedBox(height: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor, foregroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          onPressed: () {
            if (kDebugMode) {
              print("Card : $fee");
            }
          },
          child: Text("Login to Subscribe",style: TextStyle(),textAlign: TextAlign.center,),
        ),
      ],
    ),
  );
}
/// <<<  =============== End MembershipCard Design And Functional Section ==============================


