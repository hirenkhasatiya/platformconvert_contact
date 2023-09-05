import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/contact_Modal.dart';
import '../../controller/contact_controller.dart';

class contactAdd extends StatelessWidget {
  const contactAdd({super.key});

  @override
  Widget build(BuildContext context) {
    String name, contact, email, time, date, msg;

    name = contact = email = time = date = msg = "";
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.purple.shade900,
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (val) => name = val,
                  decoration: InputDecoration(
                    hintText: "Enter Name",
                    icon: Icon(
                      Icons.person,
                      color: Colors.purple.shade900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (val) => contact = val,
                  decoration: InputDecoration(
                    hintText: "Enter Number",
                    icon: Icon(
                      Icons.dialpad,
                      color: Colors.purple.shade900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (val) => email = val,
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    icon: Icon(
                      Icons.email,
                      color: Colors.purple.shade900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (val) => msg = val,
                  decoration: InputDecoration(
                    hintText: "Enter Message",
                    icon: Icon(
                      Icons.message,
                      color: Colors.purple.shade900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              TimeOfDay? time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (time != null) {
                                Provider.of<contactController>(context,
                                        listen: false)
                                    .timeChange(time: time);
                              }
                            },
                            child: Row(
                              children: [
                                Icon(Icons.watch_later_outlined),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Time"),
                                SizedBox(
                                  width: 5,
                                ),
                                Consumer<contactController>(
                                    builder: (context, Provider, child) {
                                  return Text(
                                    "${Provider.Time.hour % 12} : ${Provider.Time.minute} ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9,
                                    ),
                                  );
                                }),
                              ],
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: Provider.of<contactController>(
                                        context,
                                        listen: false)
                                    .Date,
                                firstDate: DateTime(2000),
                                lastDate: DateTime.now().add(
                                  Duration(days: 5),
                                ),
                              );
                              if (date != null) {
                                Provider.of<contactController>(context,
                                        listen: false)
                                    .dateTimeChange(dateTime: date);
                              }
                            },
                            child: Row(
                              children: [
                                Icon(Icons.date_range),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Date"),
                                SizedBox(
                                  width: 5,
                                ),
                                Consumer<contactController>(
                                    builder: (context, Provider, child) {
                                  return Text(
                                    "${Provider.Date.day} / ${Provider.Date.month} / ${Provider.Date.year}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9),
                                  );
                                }),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.purple.shade900,
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
          },
          child: Icon(Icons.done),
        ),
      ),
    );
  }
}
