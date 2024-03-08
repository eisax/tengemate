import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tengemate/helper/route_helper.dart';
import 'package:tengemate/util/dimensiona.dart';
import 'package:tengemate/util/images.dart';
import 'package:tengemate/view/screens/chat/chat_screen.dart';
import 'package:tengemate/view/screens/favourite/favourite_screen.dart';
import 'package:tengemate/view/screens/home/home_screen.dart';
import 'package:tengemate/view/screens/profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const ChatScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
 
      bottomNavigationBar:     Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeExtraLarge),
        height: Get.width * 0.15,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.25),
              spreadRadius: 5,
              blurRadius: 50,
              offset: Offset(0, 0),
            ),
          ],
        ),
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildBottomNavItem(
                0, [Images.home, Images.home_solid], "Home", context),
            buildBottomNavItem(
                1,
                [Images.favorite, Images.favorite_solid],
                "Likes",
                context),
            buildBottomNavItem(
                2, [Images.chat, Images.chat_solid], "Chat", context),
            buildBottomNavItem(3, [Images.profile, Images.profile_solid],
                "Profile", context),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavItem(
      int index, List<String> icon, String title, BuildContext context) {
    return AnimatedAlign(
      duration: Duration(milliseconds: 1000),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  _selectedIndex == index ? icon[1] : icon[0],
                  width: 18,
                  height: 18,
                  color: _selectedIndex == index
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).disabledColor,
                ),
                SizedBox(
                  height: Dimensions.paddingSizeExtraSmall,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: _selectedIndex == index
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
