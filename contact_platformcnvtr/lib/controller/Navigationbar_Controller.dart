import 'package:contact_platformcnvtr/views/screens/A_contact_Add.dart';
import 'package:contact_platformcnvtr/views/screens/A_contact_Home.dart';
import 'package:contact_platformcnvtr/views/screens/A_contact_Theme.dart';
import 'package:contact_platformcnvtr/views/screens/A_contact_edit.dart';
import 'package:flutter/material.dart';

class navigationbarController extends ChangeNotifier {
  int selectedIndex = 0;

  List Screens = [
    const contactHome(),
    const contactAdd(),
    const contactEdit(),
    const contactTheme(),
  ];

  changeScreen({required index}) {
    selectedIndex = index;
    notifyListeners();
  }
}
