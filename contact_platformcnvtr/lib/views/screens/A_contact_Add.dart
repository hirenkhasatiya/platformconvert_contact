import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/contact_Modal.dart';
import '../../controller/contact_controller.dart';

class contactAdd extends StatelessWidget {
  const contactAdd({super.key});

  @override
  Widget build(BuildContext context) {
    String name, contact, email;

    name = contact = email = "";
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: (val) => name = val,
              decoration: const InputDecoration(
                hintText: "Enter Name",
                icon: Icon(
                  Icons.person,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (val) => contact = val,
              decoration: const InputDecoration(
                hintText: "Enter Number",
                icon: Icon(Icons.dialpad),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (val) => email = val,
              decoration: const InputDecoration(
                hintText: "Enter Email",
                icon: Icon(Icons.email),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: Colors.purple.shade900,
        foregroundColor: Colors.white,
        onPressed: () {
          Contact c = Contact(
            name: name,
            number: contact,
            email: email,
          );

          Provider.of<contactController>(context, listen: false)
              .addContact(contact: c);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
