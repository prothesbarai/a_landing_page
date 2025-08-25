import 'package:a_landing_page/widgets/custom_app_bottom_bar.dart';
import 'package:a_landing_page/widgets/custom_appbar.dart';
import 'package:a_landing_page/widgets/custom_drawer.dart';
import 'package:a_landing_page/widgets/custom_floating_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  int length = 13;
  bool showAll = false;
  String allImgUrl = "assets/images/allitems.png";
  String productImg = "assets/images/p1.png";
  String productImg2 = "assets/images/p2.png";
  String productImg3 = "assets/images/p3.png";
  String productImg4 = "assets/images/p4.png";
  String productImg5 = "assets/images/p5.png";


  @override
  Widget build(BuildContext context) {

    int itemCount = showAll ? length : (length > 7 ? 8 : length);

    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = 4;
    final crossAxisSpacing = 8.0 * (crossAxisCount - 1);
    final itemWidth = (screenWidth - crossAxisSpacing) / crossAxisCount;
    final itemHeight = 110;
    final aspectRatio = itemWidth / itemHeight;


    return Scaffold(
      extendBody: true,
      appBar: CustomAppbar(),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomAppBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingButton(),

      body: ListView(
        children: [



          Container(
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    GridView.builder(
                      itemCount: itemCount,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4, childAspectRatio: aspectRatio),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {

                        if(!showAll && index == 7){
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: (){setState(() {showAll = true;});},
                              child: Container(
                                height: 300,
                                decoration: BoxDecoration(color: Color(0xffeefafa), borderRadius: BorderRadius.circular(10),),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(padding: const EdgeInsets.all(8.0), child: Image.asset(allImgUrl, height: 50, width: 50,),),
                                    Text("All")
                                  ],
                                ),
                              ),
                            ),
                          );
                        }else{
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: (){if(kDebugMode){print("Item = $index");}},
                              child: Container(
                                height: 300,
                                decoration: BoxDecoration(color: Color(0xffeefafa), borderRadius: BorderRadius.circular(10),),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(padding: const EdgeInsets.all(8.0), child: Image.asset(productImg, height: 50, width: 50,),),
                                    Text("Item")
                                  ],
                                ),
                              ),
                            ),
                          );
                        }

                      },

                    ),

                    _rectangleItemsBuilder(context, Colors.brown, Icons.account_balance, "title", "subTitle",5),

                    //SectionTitle(title: "title1", storePage: "storePage1", pageRoute: StorePage()),
                    _squareItemsBuilder(context, Colors.brown, productImg3, "Laptop",6),
                    _squareItemsBuilder(context, Colors.blueGrey, productImg5, "Product",7),
                    _squareItemsBuilder(context, Colors.indigo, productImg4, "Product",8),
                    _squareItemsBuilder(context, Colors.blueGrey, productImg3, "Product",9),




                  ],
                )
            ),
          ),


        ],
      )
    );
  }



  // Rectangle Product Items Builder
  Widget _rectangleItemsBuilder(BuildContext context,Color color, IconData icon, String title, String subTitle,int itemCount){
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title,style: TextStyle(color: Colors.white,fontSize: 20),),
                      Text(subTitle,style: TextStyle(color: Colors.white,fontSize: 20),)
                    ],
                  ),
                  SizedBox(width: 15,),
                  Icon(icon)

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Square Product Items Builder
  Widget _squareItemsBuilder(BuildContext context, Color color, String imgUrl, String title,int itemCount){
    return SizedBox(
      height: 170,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: const EdgeInsets.all(8.0), child: Image.asset(imgUrl, height: 100, width: 100,),),
                  Text(title,style: TextStyle(color: Colors.white,fontSize: 20),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }


}
