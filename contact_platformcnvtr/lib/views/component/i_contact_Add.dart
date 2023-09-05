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
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple.shade900,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.only(right: 30, top: 10, bottom: 10),
              width: double.infinity,
              child: Column(
                children: [
                  CupertinoTextFormFieldRow(
                    onChanged: (val) => name = val,
                    prefix: SizedBox(
                        width: 50,
                        child: Icon(
                          CupertinoIcons.person,
                          color: Colors.white,
                        )),
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  CupertinoTextFormFieldRow(
                    onChanged: (val) => contact = val,
                    keyboardType: TextInputType.number,
                    prefix: SizedBox(
                        width: 50,
                        child: Icon(
                          CupertinoIcons.phone_fill,
                          color: Colors.white,
                        )),
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  CupertinoTextFormFieldRow(
                    onChanged: (val) => email = val,
                    prefix: SizedBox(
                        width: 50,
                        child: Icon(
                          CupertinoIcons.mail_solid,
                          color: Colors.white,
                        )),
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  CupertinoTextFormFieldRow(
                    onChanged: (val) => msg = val,
                    prefix: SizedBox(
                        width: 50,
                        child: Icon(
                          CupertinoIcons.chat_bubble_2_fill,
                          color: Colors.white,
                        )),
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                  color: Colors.purple.shade900,
                  child: Text("Time"),
                  onPressed: () {},
                ),
                CupertinoButton(
                  color: Colors.purple.shade900,
                  child: Text("Date"),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
                color: Colors.purple.shade900,
                child: Text("Done"),
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
