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
      child: Center(),
    );
  }
}
