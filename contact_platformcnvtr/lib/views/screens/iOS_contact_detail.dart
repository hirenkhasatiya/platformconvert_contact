import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class i_DetailPage extends StatelessWidget {
  const i_DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.purple.shade900,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
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
        padding: EdgeInsets.only(top: 80, left: 16, right: 16),
      ),
    );
  }
}
