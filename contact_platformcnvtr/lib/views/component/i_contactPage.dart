import 'package:contact_platformcnvtr/controller/contact_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/contact_Modal.dart';

class iOScontactPage extends StatelessWidget {
  const iOScontactPage({super.key});

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
                            backgroundColor: Colors.purple.shade900,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
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
                    "No Contact",
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
