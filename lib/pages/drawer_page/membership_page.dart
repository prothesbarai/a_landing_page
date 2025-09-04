import 'dart:async';
import 'package:a_landing_page/pages/store_page/store_page_one.dart';
import 'package:a_landing_page/pages/store_page/store_page_two.dart';
import 'package:a_landing_page/widgets/custom_appbar.dart';
import 'package:a_landing_page/widgets/see_more_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/app_colors.dart';

class MembershipPage extends StatefulWidget {
  const MembershipPage({super.key});

  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {

  /// >>> ========== Used For Inner Section Scroll Start Here ==================
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _membershipCardKey = GlobalKey();
  /// <<< ========== Used For Inner Section Scroll End Here ====================


  /// >>> ========== Used For Carousel  Section Scroll Start Here ==============
  final ScrollController _carouselController = ScrollController();
  Timer? _timer;
  double scrollPosition = 0;
  /// <<< ========== Used For Carousel  Section Scroll End Here ================



  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    const duration = Duration(milliseconds: 50);
    const scrollStepPixel = 2.0;
    if (_carouselController.hasClients) {scrollPosition = _carouselController.offset;}
    _timer = Timer.periodic(duration, (_) {
      if (_carouselController.hasClients) {
        scrollPosition += scrollStepPixel;
        if (scrollPosition >= _carouselController.position.maxScrollExtent) {
          scrollPosition = 0;
          _carouselController.jumpTo(scrollPosition);
        } else {
          _carouselController.jumpTo(scrollPosition);
        }
      }
    });
  }




  @override
  void dispose() {
    _timer?.cancel();
    _carouselController.dispose();
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> plans = [{"fee": 1000, "validity": "1 Year Validity"}, {"fee": 600, "validity": "6 Month Validity"}, {"fee": 100, "validity": "3 Days Validity"},];
    final List<Map<String, String>> usersCarousel = [
      {"name": "Smith.t", "text": "I saved over \$200 in 3 months!.. I saved over \$200 in 3 months!.. I saved over \$200 in 3 months!", "youtube": "https://www.youtube.com/watch?v=ic3XqDNHrHQ", "image": "assets/images/user1.png",},
      {"name": "Jane.d", "text": "I improved my skills in 2 months!", "youtube": "https://www.youtube.com/watch?v=abcd1234", "image": "assets/images/user2.png",},
      {"name": "Asp Prothes", "text": "I improved my skills in 2 months!", "youtube": "https://www.youtube.com/watch?v=abcd1234", "image": "assets/images/user1.png",},
      {"name": "Hemel", "text": "I improved my skills in 2 months!", "youtube": "https://www.youtube.com/watch?v=abcd1234", "image": "assets/images/user2.png",},
      {"name": "Shreyasi", "text": "I improved my skills in 2 months!", "youtube": "https://www.youtube.com/watch?v=abcd1234", "image": "assets/images/user1.png",},
      {"name": "Angkan", "text": "I improved my skills in 2 months!", "youtube": "https://www.youtube.com/watch?v=abcd1234", "image": "assets/images/user2.png",},
      {"name": "Jane.d", "text": "I improved my skills in 2 months!", "youtube": "https://www.youtube.com/watch?v=abcd1234", "image": "",},
      {"name": "Durga", "text": "I improved my skills in 2 months!", "youtube": "https://www.youtube.com/watch?v=abcd1234", "image": "",},
      {"name": "Shampa", "text": "I improved my skills in 2 months!", "youtube": "https://www.youtube.com/watch?v=abcd1234", "image": "",},
      {"name": "Shikha", "text": "I improved my skills in 2 months!", "youtube": "https://www.youtube.com/watch?v=abcd1234", "image": "assets/images/user1.png",},
    ];
    
    final List<Map<String, dynamic>> promoList = [
      {"title": "Save UP TO 60,112 TK ON BABY CARE", "subtitle": "Become a member & buy every item at a wholesale rate", "image": "assets/images/motherchild.png", "type" : 1},
      {"title": "Get 25% OFF on Fresh Fruits", "subtitle": "Daily essentials at the best wholesale prices", "image": "assets/images/motherchild.png", "type" : 2},
      {"title": "Flat 15% OFF on Dairy Products", "subtitle": "Exclusive discount for premium members", "image": "assets/images/motherchild.png", "type" : 1},
      {"title": "Save Big on Household Essentials", "subtitle": "Shop everything at unbeatable wholesale rates", "image": "assets/images/motherchild.png", "type" : 3},
      {"title": "Up to 50% OFF on Personal Care", "subtitle": "Stock up your favorites at wholesale pricing", "image": "assets/images/motherchild.png", "type" : 1},
      {"title": "Wholesale Deals on Electronics", "subtitle": "Get your gadgets at factory prices", "image": "assets/images/motherchild.png", "type" : 2},
    ];


    final List<Color> bgColors = [AppColor.primaryColor, AppColor.yellowAccent];
    final List<Color> titleAndDesColors = [Colors.white, AppColor.primaryColor,];

    return Scaffold(
      extendBody: true,
      appBar: CustomAppbar(pageTitle: "Membership Page"),
      body: ListView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        children: [

          /// >>> =============== Top Section Start Here =============
          Padding(
            padding: EdgeInsets.only(left: 8.0,right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 200,
                margin: const EdgeInsets.only(top: 16,),
                child: Stack(
                  children: [
                    // Right side triangle background
                    Align(
                      alignment: Alignment.centerRight,
                      child: ClipPath(
                        clipper: TopRightTriangleClipper(),
                        child: Container(width: 320, height: 310, color: AppColor.primaryColor,),
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
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.primaryColor, height: 1.4,),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                      final ctx = _membershipCardKey.currentContext;
                                      if (ctx != null) {
                                        Scrollable.ensureVisible(ctx, duration: const Duration(milliseconds: 600), curve: Curves.easeInOut,);
                                      } else {
                                        _scrollController.animateTo(800, duration: const Duration(milliseconds: 600), curve: Curves.easeInOut,);
                                        if (kDebugMode) print("MembershipCard section not built yet");
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.yellowAccent, foregroundColor: AppColor.primaryColor,
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
                              padding: EdgeInsets.only(bottom: 2.0,right: 2.0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment : Alignment.bottomCenter,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset("assets/images/motherchild.png", fit: BoxFit.fill,),
                                    ),
                                  )
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          /// <<< =============== Top Section End Here ===============

          SizedBox(height: 5.0,),


          /// >>> Item And Navigate Section Start Here ===================
          ListView.builder(
            itemCount: promoList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final dataList = promoList[index];
              bool reverse = index % 2 != 0;

              Widget navigatePage;
              if (dataList['type'] == 1) {
                navigatePage = StorePageOne();
              }else if(dataList['type'] == 2){
                navigatePage = StorePageTwo();
              }else {
                navigatePage = Scaffold(appBar: AppBar(title: Text("No Found",style: TextStyle(color: Colors.white),),backgroundColor: AppColor.primaryColor,), body: Center(child: Text("No page defined")),);
              }

              return _buildSection(context, dataList['title'], dataList['subtitle'], dataList['image'], reverse, bgColors[index % bgColors.length], titleAndDesColors[index % titleAndDesColors.length], titleAndDesColors[index % titleAndDesColors.length], navigatePage,);
            },
          ),
          /// >>> Item And Navigate Section End Here =====================




          Padding(
            key: _membershipCardKey,
            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8.0),
            child: Text("Get Paikaree Membership Card Now",style: TextStyle(color: AppColor.primaryColor,fontSize: 20, fontWeight: FontWeight.bold),),
          ),


          /// >>>  =============== Start MembershipCard Builder Section ==============================
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1 + ((plans.length - 1) / 2).ceil(),
            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(padding: const EdgeInsets.only(bottom: 8.0), child: memberShipCardDesignAndBuild(context, plans[0]),);
              }
              // Remaining cards in pairs
              int firstIndex = 1 + (index - 1) * 2;
              int secondIndex = firstIndex + 1;
              final firstCard = plans[firstIndex];
              final secondCard = secondIndex < plans.length ? plans[secondIndex] : null;

              return Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Expanded(child: memberShipCardDesignAndBuild(context, firstCard)),
                    if (secondCard != null) ...[
                      const SizedBox(width: 8.0),
                      Expanded(child: memberShipCardDesignAndBuild(context, secondCard),),
                    ],
                  ],
                ),
              );
            },
          ),
          /// <<<  =============== End MembershipCard Builder Section ================================


          /// >>> ======================= Carousel Section Start Here ================================
          SizedBox(
              height: 130,
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if(notification is UserScrollNotification){
                    if(notification.direction != ScrollDirection.idle){
                      _timer?.cancel();
                    }else{
                      _startAutoScroll();
                    }
                  }
                  return true;
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: usersCarousel.length,
                  controller: _carouselController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final user = usersCarousel[index];
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
                                backgroundImage: user['image'] != null && user['image']!.isNotEmpty ? AssetImage(user['image']!) : null,
                                child: user['image'] == null || user['image']!.isEmpty ?  Icon(Icons.person,size: 60,) : null,
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SeeMoreText(
                                      mainMessageText: "${user['text']}",
                                      seeMoreText: "See more",
                                      alertDialogueCancelButtonText: "Ok",
                                      parentWidgetStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),
                                      dialogueWidgetStyle: TextStyle(color: Colors.pink,fontSize: 14),
                                      seeMoreTextStyle: TextStyle(color: Colors.pink),
                                      maxLines: 2,
                                      dialogueBorderRadius: 16,
                                      alertDialogueCancelButtonTextStyle: TextStyle(color: Colors.white),
                                      alertDialogueCancelButtonStyle: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),), padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${user['name']}",style: TextStyle(fontWeight: FontWeight.bold),),
                                        GestureDetector(
                                          onTap: () async {
                                            final Uri url = Uri.parse("${user["youtube"]}");
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
              )
          ),
          /// <<< ======================= Carousel Section End Here ==================================


          /// >>> Table Section Start Here ===================================
          Padding(
            padding: const EdgeInsets.only(top: 20.0,left: 8.0,right: 8.0,),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Color(0xFFF4EFDF), borderRadius: BorderRadius.circular(12),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('How much do you spend montly?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),
                  const SizedBox(height: 10),
                  Table(
                    columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(2), 2: FlexColumnWidth(1),},
                    children: [
                      _tableRow("Baby care", "Member price", "Vou. Save",true),
                      _tableRow("Cetaphil...", "550", "670",false),
                      _tableRow("Royal Ca...", "1090", "670",false),
                    ],
                  ),
                ],
              ),
            ),
          ),
          /// <<< Table Section End Here =====================================


          SizedBox(height: 90,)
        ],
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


/// >>> =========== Image & Text Section Widget Build Start Here ======================
Widget _buildSection(BuildContext context, String title, String description, String imgUrl, bool reverse, Color bgColor,Color titleColor,Color desColor, Widget navigatePage){
  return GestureDetector(
    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => navigatePage,)),
    child: Padding(
        padding: EdgeInsets.only(left: 8.0,right: 8.0, top: 4.0, bottom: 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 140,
          decoration: BoxDecoration(color: bgColor,),
          child: Row(


            children: [
              reverse ? Expanded(
                flex: 3,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(imgUrl,height: 150, fit: BoxFit.fill,)
                    )
                ),
              ): Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: titleColor, height: 1.4,),),
                      SizedBox(height: 5,),
                      Text(description, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: desColor, height: 1.4,),),
                    ],
                  ),
                ),
              ),

              reverse ? Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: titleColor, height: 1.4,),textAlign: TextAlign.right,),
                      SizedBox(height: 5,),
                      Text(description, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: desColor, height: 1.4,),textAlign: TextAlign.right,),
                    ],
                  ),
                ),
              ) : Expanded(
                flex: 3,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(imgUrl,height: 150, fit: BoxFit.fill,)
                        )
                    )
                ),
              ),

            ],
          ),
        ),
      ),
    )
  );
}
/// <<< =========== Image & Text Section Widget Build End Here ========================


/// >>> Table Row Items Design Start Here ======================================
TableRow _tableRow(String title, String memberPrice, String savePrice, bool tHead) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(title, style: tHead? TextStyle(fontWeight: FontWeight.w600, fontSize: 13,): TextStyle(fontSize: 12),),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(memberPrice, style: tHead? TextStyle(fontWeight: FontWeight.w600, fontSize: 13,): TextStyle(fontSize: 12),),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(savePrice, style: tHead? TextStyle(fontWeight: FontWeight.w600, fontSize: 13,): TextStyle(fontSize: 12),),
      ),
    ],
  );
}
/// <<< Table Row Items Design End Here ========================================


/// >>>  =============== Start MembershipCard Design And Functional Section ==============================
Widget memberShipCardDesignAndBuild(BuildContext context , Map<String, dynamic>? plan) {
  return InkWell(
    onTap: () {if (kDebugMode) print("Card tapped without button: ${plan?["fee"]}");},
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          //Positioned.fill(child: plan?["fee"] == "1000 TK" ? MemberCardGradiantBgColor(colors: AppColor.memberCard1000ColorPalette,) : plan?["fee"] == "600 TK" ? MemberCardGradiantBgColor(colors: AppColor.memberCard600ColorPalette,) : MemberCardGradiantBgColor(colors: AppColor.memberCard100ColorPalette,),),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            decoration: BoxDecoration(color: Color(0xFFF7F0DB), border: Border.all(color: AppColor.primaryColor), borderRadius: BorderRadius.circular(12),),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${plan?["fee"]} TK", style: TextStyle(fontSize: 16, color: AppColor.primaryColor)),
                SizedBox(height: 4),
                Text("${plan?["validity"]}", style: TextStyle(fontSize: 16, color: AppColor.primaryColor)),
                SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50), side: const BorderSide(color: Colors.white, width: 2),),),
                  onPressed: () {if (kDebugMode) {print("${plan?["fee"]}");}},
                  child: Text("Subscribe",style: TextStyle(),textAlign: TextAlign.center,),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
/// <<<  =============== End MembershipCard Design And Functional Section ==============================


