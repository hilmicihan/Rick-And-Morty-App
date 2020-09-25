import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

String data;

class CharacterInfo {
  String imageUrl;
  String name;
  String status;
  String location;
  bool iconPressed = false;
  CharacterInfo({imageUrl, name, status, location}) {
    this.imageUrl = imageUrl;
    this.location = location;
    this.name = name;
    this.status = status;
  }
}

CharacterInfo currentCharacter;
bool searched = false;
List<CharacterInfo> characterArr = new List();
List<CharacterInfo> likedCharacterArr =
    new List(); // it keeps data of character which is liked
List<CharacterInfo> deadCharacterArr =
    new List(); // it keeps data of character which is liked
List<CharacterInfo> aliveCharacterArr =
    new List(); // it keeps data of character which is liked
List<NetworkImage> imageArr = new List();
AutoCompleteTextField searchTextField;
GlobalKey<AutoCompleteTextFieldState<CharacterInfo>> key = new GlobalKey();
