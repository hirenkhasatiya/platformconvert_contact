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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
