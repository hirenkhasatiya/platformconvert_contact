import 'package:contact_platformcnvtr/views/component/A_contact_Add.dart';
import 'package:contact_platformcnvtr/views/component/i_contactPage.dart';
import 'package:contact_platformcnvtr/views/component/i_contact_Add.dart';
import 'package:contact_platformcnvtr/views/component/i_contact_Chat.dart';
import 'package:contact_platformcnvtr/views/component/i_contact_Theme.dart';
import 'package:flutter/material.dart';

import '../views/component/A_contactPage.dart';
import '../views/component/A_setting.dart';
import '../views/component/A_contact_Chat.dart';

class navigationbarController extends ChangeNotifier {
  int selectedIndex = 0;

  List androidScreens = [
    const contactAdd(),
    const contactChat(),
    const contactPage(),
    const settingPage(),
  ];
  List iOSScreens = [
    const iOScontactAdd(),
    const iOSchatPage(),
    const iOScontactPage(),
    const iOScontactTheme(),
  ];

  changeScreen({required index}) {
    selectedIndex = index;
    notifyListeners();
  }
}
