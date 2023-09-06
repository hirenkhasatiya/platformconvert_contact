import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Modals/contact_Modal.dart';

class contactController extends ChangeNotifier {
  List<Contact> _allcontact = [];

  DateTime Date = DateTime.now();

  TimeOfDay Time = TimeOfDay.now();

  late SharedPreferences preferences;

  contactController({required this.preferences});

  List<String> allNames = [];
  List<String> allEmails = [];
  List<String> allContacts = [];
  List<String> allmsg = [];
  List<String> allTime = [];
  List<String> allDate = [];

  initData() {
    allNames = preferences.getStringList("name") ?? [];
    allEmails = preferences.getStringList("Email") ?? [];
    allContacts = preferences.getStringList("number") ?? [];
    allmsg = preferences.getStringList("msg") ?? [];
    allTime = preferences.getStringList("time") ?? [];
    allDate = preferences.getStringList("date") ?? [];

    _allcontact = List.generate(
      allNames.length,
      (index) => Contact(
        name: allNames[index],
        email: allEmails[index],
        number: allContacts[index],
        message: allmsg[index],
        Date: allDate[index],
        Time: allTime[index],
      ),
    );
  }

  setData() {
    preferences
      ..setStringList("name", allNames)
      ..setStringList("Email", allEmails)
      ..setStringList("number", allContacts)
      ..setStringList("msg", allmsg)
      ..setStringList("time", allTime)
      ..setStringList("date", allDate);

    notifyListeners();
  }

  List<Contact> get getContact {
    initData();
    return _allcontact;
  }

  addContact({required Contact contact}) {
    if (!_allcontact.any((element) => element.number == contact.number)) {
      _allcontact.add(contact);

      allNames.add(contact.name);
      allEmails.add(contact.email);
      allContacts.add(contact.number);
      allmsg.add(contact.message);
      allTime.add(contact.Time);
      allDate.add(contact.Date);

      setData();
    }

    notifyListeners();
  }

  editContact({required int index, required Contact contact}) {
    initData();

    allNames[index] = contact.name;
    allEmails[index] = contact.email;
    allContacts[index] = contact.number;
    allmsg[index] = contact.message;
    allDate[index] = contact.Date;
    allTime[index] = contact.Time;

    setData();
  }

  removeContact({required int index}) {
    initData();

    allNames.removeAt(index);
    allEmails.removeAt(index);
    allContacts.removeAt(index);
    allmsg.removeAt(index);
    allTime.removeAt(index);
    allDate.removeAt(index);

    setData();

    notifyListeners();
  }

  dateTimeChange({required DateTime dateTime}) {
    Date = dateTime;
    notifyListeners();
  }

  timeChange({required TimeOfDay time}) {
    Time = time;
    notifyListeners();
  }

  call({required String number}) async {
    Uri uri = Uri(
      scheme: 'tel',
      path: number,
    );
    await launchUrl(uri);
  }

  sms({required String path}) async {
    Uri uri = Uri(
      scheme: 'sms',
      path: path,
    );
    await launchUrl(uri);
  }

  email({required String email}) async {
    Uri uri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(uri);
  }
}
