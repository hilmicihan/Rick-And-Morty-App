import 'package:flutter/material.dart';
import 'package:rick_and_mrty_app/data/characterData.dart';
import '../main.dart';

class ScreenDead extends StatefulWidget {
  @override
  _ScreenDeadState createState() => _ScreenDeadState();
}

class _ScreenDeadState extends State<ScreenDead> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            for (var i in deadCharacterArr) ListElement(i: i),
          ],
        ),
      ),
    );
  }
}
