import 'package:contact_platformcnvtr/controller/Navigationbar_Controller.dart';
import 'package:contact_platformcnvtr/controller/platform_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class iOS_homePage extends StatelessWidget {
  const iOS_homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.purple.shade900,
          middle: Text(
            "Contact App",
            style: TextStyle(
              color: CupertinoColors.white,
            ),
          ),
          trailing: Consumer<platformcontroller>(
            builder: (context, Provider, child) {
              return GestureDetector(
                onTap: () {
                  Provider.changePlatform();
                },
                child: Icon(
                  Icons.android_rounded,
                  color: CupertinoColors.white,
                ),
              );
            },
          ),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            currentIndex:
                Provider.of<navigationbarController>(context).selectedIndex,
            onTap: (index) {
              Provider.of<navigationbarController>(context, listen: false)
                  .changeScreen(index: index);
            },
            activeColor: Colors.purple.shade900,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_add_solid), label: "Add"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble_2_fill), label: "Chat"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.phone_fill), label: "Call"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings_solid), label: "Setting"),
            ],
          ),
          tabBuilder: (context, index) =>
              Provider.of<navigationbarController>(context).iOSScreens[index],
        ));
  }
}
