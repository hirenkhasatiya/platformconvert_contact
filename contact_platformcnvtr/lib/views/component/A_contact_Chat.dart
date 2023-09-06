import 'package:contact_platformcnvtr/controller/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/contact_Modal.dart';

class contactChat extends StatelessWidget {
  const contactChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: Padding(
        padding: const EdgeInsets.all(16),
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
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text(
                                  "Are you sure...",
                                  style: TextStyle(fontSize: 18),
                                ),
                                content: Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Provider.removeContact(index: index);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Delet"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          leading: CircleAvatar(
                            child: Text(contact.name[0].toUpperCase()),
                          ),
                          title: Text(contact.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("${contact.message}"),
                          trailing: Consumer<contactController>(
                              builder: (context, Provider, child) {
                            return Text(
                              "${Provider.Time.hour % 12} : ${Provider.Time.minute} ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                              ),
                            );
                          }),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    "No Message",
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
