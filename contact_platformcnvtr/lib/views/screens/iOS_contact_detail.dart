import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/contact_Modal.dart';
import '../../controller/contact_controller.dart';

class i_DetailPage extends StatelessWidget {
  const i_DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    int contact_detail = ModalRoute.of(context)!.settings.arguments as int;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemIndigo,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
        middle: const Text(
          "Contact Detail",
          style: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
        child: Center(
          child: Consumer<contactController>(
            builder: (context, Provider, child) {
              Contact contact = Provider.getContact[contact_detail];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: CupertinoColors.systemIndigo,
                    child: Text(
                      contact.name[0].toUpperCase(),
                      style: const TextStyle(
                          fontSize: 35, color: CupertinoColors.white),
                    ),
                  ),
                  Text(contact.name, style: const TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 25,
                  ),
                  const Divider(),
                  Consumer<contactController>(
                      builder: (context, Provider, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          backgroundColor: CupertinoColors.systemIndigo,
                          onPressed: () {
                            Provider.call(number: contact.number);
                          },
                          child: const Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: CupertinoColors.systemIndigo,
                          onPressed: () {
                            Provider.sms(path: contact.name);
                          },
                          child: const Icon(
                            Icons.message_outlined,
                            color: Colors.white,
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: CupertinoColors.systemIndigo,
                          onPressed: () {
                            Provider.email(email: contact.email);
                          },
                          child: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: CupertinoColors.systemIndigo,
                          onPressed: () {},
                          child: const Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  }),
                  const Divider(),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey4,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Contact Info",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(contact.number,
                            style: const TextStyle(fontSize: 15)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(contact.email,
                            style: const TextStyle(fontSize: 15)),
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
