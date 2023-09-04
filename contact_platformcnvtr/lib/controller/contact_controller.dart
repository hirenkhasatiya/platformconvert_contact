import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Modals/contact_Modal.dart';

class contactController extends ChangeNotifier {
  List<Contact> _allcontact = [];

  late SharedPreferences preferences;

  contactController({required this.preferences});

  List<String> allNames = [];
  List<String> allEmails = [];
  List<String> allContacts = [];
  List<String> allmsg = [];

  init() {
    allNames = preferences.getStringList("name") ?? [];
    allEmails = preferences.getStringList("Email") ?? [];
    allContacts = preferences.getStringList("number") ?? [];
    allmsg = preferences.getStringList("msg") ?? [];

    _allcontact = List.generate(
      allNames.length,
      (index) => Contact(
        name: allNames[index],
        email: allEmails[index],
        number: allContacts[index],
        msg: allmsg[index],
      ),
    );
  }

  set() {
    preferences
      ..setStringList("name", allNames)
      ..setStringList("Email", allEmails)
      ..setStringList("number", allContacts)
      ..setStringList("msg", allmsg);

    notifyListeners();
  }

  List<Contact> get getContact {
    init();
    return _allcontact;
  }

  addContact({required Contact contact}) {
    if (!_allcontact.any((element) => element.number == contact.number)) {
      _allcontact.add(contact);

      allNames.add(contact.name);
      allEmails.add(contact.email);
      allContacts.add(contact.number);
      allmsg.add(contact.msg);

      set();
    }
    notifyListeners();
  }

  editContact({required int index, required Contact contact}) {
    init();

    allNames[index] = contact.name;
    allEmails[index] = contact.email;
    allContacts[index] = contact.number;
    allmsg[index] = contact.msg;

    set();
  }

  removeContact({required int index}) {
    init();

    allNames.removeAt(index);
    allEmails.removeAt(index);
    allContacts.removeAt(index);
    allmsg.removeAt(index);

    set();

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
