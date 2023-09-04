import 'package:contact_platformcnvtr/controller/Navigationbar_Controller.dart';
import 'package:contact_platformcnvtr/controller/contact_controller.dart';
import 'package:contact_platformcnvtr/controller/platform_controller.dart';
import 'package:contact_platformcnvtr/views/screens/android_contact_detail.dart';
import 'package:contact_platformcnvtr/views/screens/android_homePage.dart';
import 'package:contact_platformcnvtr/views/screens/iOS_homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => contactController(preferences: preferences),
        ),
        ChangeNotifierProvider(
          create: (context) => platformcontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => navigationbarController(),
        ),
        ChangeNotifierProvider(
          create: (context) => themeController(preferences: preferences),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.of<platformcontroller>(context).isandroid
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              appBarTheme: AppBarTheme(
                color: Colors.purple.shade900,
                foregroundColor: Colors.white,
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.purple.shade900,
                  foregroundColor: Colors.white),
              timePickerTheme: TimePickerThemeData(
                backgroundColor: Colors.white,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors.purple.shade900),
              )),
              useMaterial3: true,
            ),
            themeMode: Provider.of<themeController>(context).getTheme
                ? ThemeMode.dark
                : ThemeMode.light,
            routes: {
              '/': (context) => android_HomePage(),
              'Detail_Page': (context) => DetailPage(),
            },
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: iOS_homePage(),
          );
  }
}
