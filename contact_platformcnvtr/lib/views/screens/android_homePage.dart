import 'package:contact_platformcnvtr/controller/Navigationbar_Controller.dart';
import 'package:contact_platformcnvtr/controller/platform_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class android_HomePage extends StatelessWidget {
  const android_HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact App"),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<platformcontroller>(context, listen: false)
                    .changePlatform();
              },
              icon: Icon(Icons.apple_rounded)),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.purple.shade900,
        animationDuration: const Duration(milliseconds: 300),
        items: [
          Icon(
            Icons.add_box,
            color: Colors.purple.shade900,
          ),
          Icon(
            Icons.chat,
            color: Colors.purple.shade900,
          ),
          Icon(
            Icons.call,
            color: Colors.purple.shade900,
          ),
          Icon(
            Icons.settings,
            color: Colors.purple.shade900,
          ),
        ],
        onTap: (index) {
          Provider.of<navigationbarController>(context, listen: false)
              .changeScreen(index: index);
        },
      ),
      body: Provider.of<navigationbarController>(context)
          .Screens[Provider.of<navigationbarController>(context).selectedIndex],
    );
  }
}
