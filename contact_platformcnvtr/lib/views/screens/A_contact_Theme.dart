import 'package:flutter/material.dart';

class contactTheme extends StatelessWidget {
  const contactTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Contact Theme",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
