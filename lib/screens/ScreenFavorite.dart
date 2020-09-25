import 'package:flutter/material.dart';
import 'package:rick_and_mrty_app/data/characterData.dart';
import 'package:rick_and_mrty_app/utils/constant.dart';
import 'package:rick_and_mrty_app/utils/widgetUtils.dart';

import '../main.dart';
import 'ScreenInfo.dart';

class ScreenFavorite extends StatefulWidget {
  @override
  _ScreenFavoriteState createState() => _ScreenFavoriteState();
}

class _ScreenFavoriteState extends State<ScreenFavorite> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            for (var i in likedCharacterArr) ListElement(i: i),
          ],
        ),
      ),
    );
  }
}
