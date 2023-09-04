import 'package:contact_platformcnvtr/controller/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/contact_Modal.dart';

class contactPage extends StatelessWidget {
  const contactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
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
                          trailing: IconButton(
                            onPressed: () {
                              Provider.removeContact(index: index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text(contact.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                        color: Colors.white),
                  ),
                ),
        ),
      ),
    );
  }
}
