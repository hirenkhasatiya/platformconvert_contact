import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/contact_Modal.dart';
import '../../controller/contact_controller.dart';

class iOScontactAdd extends StatelessWidget {
  const iOScontactAdd({super.key});

  @override
  Widget build(BuildContext context) {
    String name, contact, email, time, date, msg;

    name = contact = email = time = date = msg = "";
    return CupertinoPageScaffold(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: CupertinoColors.inactiveGray.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.only(right: 30, top: 10, bottom: 10),
              width: double.infinity,
              child: Column(
                children: [
                  CupertinoTextFormFieldRow(
                    onChanged: (val) => name = val,
                    placeholder: "Enter Name",
                    prefix: const SizedBox(
                        width: 50,
                        child: Icon(
                          CupertinoIcons.person,
                          color: CupertinoColors.systemIndigo,
                        )),
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                  CupertinoTextFormFieldRow(
                    onChanged: (val) => contact = val,
                    keyboardType: TextInputType.number,
                    placeholder: "Enter Number",
                    prefix: const SizedBox(
                        width: 50,
                        child: Icon(
                          CupertinoIcons.phone_fill,
                          color: CupertinoColors.systemIndigo,
                        )),
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                  CupertinoTextFormFieldRow(
                    onChanged: (val) => email = val,
                    placeholder: "Enter Email",
                    prefix: const SizedBox(
                        width: 50,
                        child: Icon(
                          CupertinoIcons.mail_solid,
                          color: CupertinoColors.systemIndigo,
                        )),
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                  CupertinoTextFormFieldRow(
                    placeholder: "Enter Chat",
                    onChanged: (val) => msg = val,
                    prefix: const SizedBox(
                        width: 50,
                        child: Icon(
                          CupertinoIcons.chat_bubble_2_fill,
                          color: CupertinoColors.systemIndigo,
                        )),
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                  color: CupertinoColors.systemIndigo,
                  child: const Text("Time"),
                  onPressed: () {},
                ),
                CupertinoButton(
                  color: CupertinoColors.systemIndigo,
                  child: const Text("Date"),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton(
                color: CupertinoColors.systemIndigo,
                child: const Text("Done"),
                onPressed: () {
                  Contact c = Contact(
                    name: name,
                    number: contact,
                    email: email,
                    message: msg,
                    Date: date,
                    Time: time,
                  );

                  Provider.of<contactController>(context, listen: false)
                      .addContact(contact: c);
                })
          ],
        ),
      ),
    );
  }
}
