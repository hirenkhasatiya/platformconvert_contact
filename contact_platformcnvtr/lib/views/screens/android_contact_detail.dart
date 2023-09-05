import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/contact_Modal.dart';
import '../../controller/contact_controller.dart';

class A_DetailPage extends StatelessWidget {
  const A_DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    int contact_detail = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        foregroundColor: Colors.white,
        actions: [
          Consumer<contactController>(builder: (context, Provider, child) {
            Contact contact = Provider.getContact[contact_detail];
            return PopupMenuButton(
              offset: Offset(70, 50),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text("settings"),
                ),
                const PopupMenuItem(
                  child: Text("Share Contact"),
                ),
                PopupMenuItem(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Delete Contact"),
                ),
              ],
            );
          }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Consumer<contactController>(
            builder: (context, Provider, child) {
              Contact contact = Provider.getContact[contact_detail];
              return Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.purple.shade900,
                    radius: 60,
                    child: Text(
                      contact.name[0].toUpperCase(),
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SelectableText(contact.name, style: TextStyle(fontSize: 20)),
                  const Divider(),
                  Consumer<contactController>(
                      builder: (context, Provider, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.purple.shade900,
                          onPressed: () {
                            Provider.call(number: contact.number);
                          },
                          child: Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.purple.shade900,
                          onPressed: () {
                            Provider.sms(path: contact.name);
                          },
                          child: Icon(
                            Icons.message_outlined,
                            color: Colors.white,
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.purple.shade900,
                          onPressed: () {
                            Provider.email(email: contact.email);
                          },
                          child: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.purple.shade900,
                          onPressed: () async {
                            // await Share.share(
                            //     "${contact.name} \n\n${contact.number}");
                          },
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  }),
                  const Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Info",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(contact.number, style: TextStyle(fontSize: 15)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(contact.email, style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
