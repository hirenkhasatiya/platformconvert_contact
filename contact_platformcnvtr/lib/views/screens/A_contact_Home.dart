import 'package:contact_platformcnvtr/controller/contact_controller.dart';
import 'package:contact_platformcnvtr/views/screens/A_contact_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/contact_Modal.dart';

class contactHome extends StatelessWidget {
  const contactHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Consumer<contactController>(
          builder: (context, Provider, child) => Provider.getContact.isNotEmpty
              ? ListView.builder(
                  itemCount: Provider.getContact.length,
                  itemBuilder: (context, index) {
                    Contact contact = Provider.getContact[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('Detail_Page', arguments: index);
                      },
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(contact.name[0].toUpperCase()),
                          ),
                          title: Text(contact.name),
                          subtitle: Text(contact.number),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "Please Add Contact",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade900),
                  ),
                ),
        ),
      ),
    );
  }
}
