import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rick_and_mrty_app/data/characterData.dart';

var url = "https://rickandmortyapi.com/api/";
var urlChar = "https://rickandmortyapi.com/api/character";
void getData() async {
  http.Response response = await http.get(url);
  print(response.body);
}

void getCharachters() async {
  http.Response response = await http.get(urlChar);
  var data = jsonDecode(response.body);

  var prev = data["info"]["prev"];
  if (prev == null) print(prev);
}

CharacterInfo makeCharacter(var characterData) {
  String imageUrl;
  String name;
  String status;
  String location;
  imageUrl = characterData["image"];

  name = characterData["name"];
  status = characterData["status"];
  location = characterData["location"]["name"];
  CharacterInfo newCharacter = CharacterInfo(
      imageUrl: imageUrl, name: name, status: status, location: location);
  return newCharacter;
}

Future updateCharacterData() async {
  characterArr.clear();
  http.Response response = await http.get(urlChar);
  var data = jsonDecode(response.body);

  var nextUrl = data["info"]["next"];

  while (nextUrl != null) {
    http.Response response = await http.get(nextUrl);
    data = jsonDecode(response.body);
    nextUrl = data["info"]["next"];
    var characterMap = data["results"][0];

    CharacterInfo newCharacter = makeCharacter(characterMap);
    characterArr.add(newCharacter);
    if (newCharacter.status == "Dead")
      deadCharacterArr.add(newCharacter);
    else if (newCharacter.status == "Alive")
      aliveCharacterArr.add(newCharacter);
  }
  print(characterArr.length);
  characterArr.sort((a, b) => a.name.compareTo(b.name));
}
