import 'package:contact_platformcnvtr/views/component/A_contact_Add.dart';
import 'package:flutter/material.dart';

import '../views/component/A_contactPage.dart';
import '../views/component/A_contact_Theme.dart';
import '../views/component/A_contact_Chat.dart';

class navigationbarController extends ChangeNotifier {
  int selectedIndex = 0;

  List Screens = [
    const contactAdd(),
    const contactEdit(),
    const contactPage(),
    const contactTheme(),
  ];

  changeScreen({required index}) {
    selectedIndex = index;
    notifyListeners();
  }
}
