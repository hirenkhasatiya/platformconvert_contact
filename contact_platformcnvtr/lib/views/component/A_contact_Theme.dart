import 'package:contact_platformcnvtr/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class contactTheme extends StatelessWidget {
  const contactTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text("Select Theme"),
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
