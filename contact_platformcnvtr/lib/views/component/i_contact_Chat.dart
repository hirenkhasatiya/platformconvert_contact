import 'package:contact_platformcnvtr/controller/contact_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/contact_Modal.dart';

class iOSchatPage extends StatelessWidget {
  const iOSchatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Consumer<contactController>(
          builder: (context, Provider, child) => Provider.getContact.isNotEmpty
              ? ListView.builder(
                  itemCount: Provider.getContact.length,
                  itemBuilder: (context, index) {
                    Contact contact = Provider.getContact[index];
                    return GestureDetector(
                      onVerticalDragEnd: (val) {
                        Provider.removeContact(index: index);
                      },
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.purple.shade900,
                            child: Text(contact.name[0].toUpperCase(),
                                style: TextStyle(color: Colors.white)),
                          ),
                          title: Text(contact.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(contact.message),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "No Message",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade900),
                  ),
                ),
        ),
      ),
    );
  }
}
