import 'package:flutter/material.dart';

class contactEdit extends StatelessWidget {
  const contactEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Edit Contact",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
