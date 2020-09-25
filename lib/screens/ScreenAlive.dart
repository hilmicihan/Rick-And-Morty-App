import 'package:flutter/material.dart';
import 'package:rick_and_mrty_app/data/characterData.dart';
import '../main.dart';

class ScreenAlive extends StatefulWidget {
  @override
  _ScreenAliveState createState() => _ScreenAliveState();
}

class _ScreenAliveState extends State<ScreenAlive> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            for (var i in aliveCharacterArr) ListElement(i: i),
          ],
        ),
      ),
    );
  }
}
