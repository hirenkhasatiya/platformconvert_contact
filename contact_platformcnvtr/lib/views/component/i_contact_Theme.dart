import 'package:contact_platformcnvtr/controller/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class iOScontactTheme extends StatelessWidget {
  const iOScontactTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Card(
          child: Row(
            children: [
              Row(
                children: [
                  const Text(
                    "Select Theme",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.systemIndigo),
                  ),
                  const SizedBox(
                    width: 160,
                  ),
                  Consumer<themeController>(
                      builder: (context, Provider, child) {
                    return CupertinoSwitch(
                        activeColor: CupertinoColors.systemIndigo,
                        value: Provider.getTheme,
                        onChanged: (val) {
                          Provider.changeTheme();
                        });
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
