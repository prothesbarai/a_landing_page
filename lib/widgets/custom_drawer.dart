import 'package:a_landing_page/pages/drawer_page/membership_page.dart';
import 'package:flutter/material.dart';

import '../pages/utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black.withValues(alpha: 0.2),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          DrawerHeader(
            decoration: UnderlineTabIndicator(borderSide: BorderSide(color: AppColors.primaryColor,width: 1)),
            child: Row(
                children: [
                  CircleAvatar(radius: 40,backgroundColor: AppColors.primaryColor,child: Icon(Icons.account_circle,size: 60,),),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Profile Name",style: TextStyle(color: Colors.white,fontSize: 20),overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 5,),
                        Text("8801xxxxxxxxx",style: TextStyle(color: Colors.white,fontSize: 20),overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  )
                ],
              )
          ),
          _buildDrawerItems(context, "Membership", Icons.card_membership,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
           Divider(color: AppColors.primaryColor,thickness:1.5,),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
          _buildDrawerItems(context, "Home", Icons.home,MembershipPage()),
        ],
      ),
    );
  }



  Widget _buildDrawerItems(BuildContext context,String title,IconData icon,Widget navigatePage){
    return ListTile(
      title: Text(title,style: TextStyle(color: Colors.white),),
      leading: Icon(icon,color: Colors.white,),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => navigatePage,));
      },
    );
  }

}


