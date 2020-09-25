import 'package:flutter/cupertino.dart';
import 'package:rick_and_mrty_app/main.dart';
import 'package:rick_and_mrty_app/screens/ScreenAlive.dart';
import 'package:rick_and_mrty_app/screens/ScreenFavorite.dart';
import 'package:rick_and_mrty_app/screens/screenDead.dart';

List<Widget> listOfScreens = [
  ScreenCharacterList(),
  ScreenFavorite(),
  ScreenDead(),
  ScreenAlive(),
];
