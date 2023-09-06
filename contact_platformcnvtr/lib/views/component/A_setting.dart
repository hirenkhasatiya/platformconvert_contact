import 'package:contact_platformcnvtr/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class settingPage extends StatelessWidget {
  const settingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text("Select Theme"),
                trailing: Consumer<themeController>(
                    builder: (context, Provider, child) {
                  return Switch(
                      value: Provider.getTheme,
                      onChanged: (val) {
                        Provider.changeTheme();
                      });
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
