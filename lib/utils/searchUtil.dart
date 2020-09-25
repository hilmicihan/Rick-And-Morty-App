import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_mrty_app/data/characterData.dart';
import 'package:rick_and_mrty_app/screens/ScreenInfo.dart';
import 'package:rick_and_mrty_app/utils/constant.dart';

class SearchCharacter extends SearchDelegate<CharacterInfo> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    CharacterInfo currentCharacter;
    for (var i in characterArr) {
      if (i.name.toLowerCase() == query.toLowerCase()) {
        currentCharacter = i;
        break;
      }
    }

    return InfoScreen(
      character: characterArr[0],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<CharacterInfo> suggestionList = new List();

    if (query == "")
      suggestionList.add(characterArr[0]);
    else {
      characterArr.forEach((element) {
        if (element.name.toLowerCase().startsWith(query.toLowerCase()))
          suggestionList.add(element);
      });
      suggestionList.sort((a, b) => a.name.compareTo(b.name));
    }
    return Column(
      children: [
        for (var element in suggestionList) SearcInfoPart(i: element),
      ],
    );
  }
}

class SearcInfoPart extends StatefulWidget {
  SearcInfoPart({this.i});
  final CharacterInfo i;
  @override
  _SearcInfoPartState createState() => _SearcInfoPartState();
}

class _SearcInfoPartState extends State<SearcInfoPart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InfoScreen(
                        character: widget.i,
                      )),
            );
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: infoBackround,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              CachedNetworkImage(
                imageUrl: widget.i.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      widget.i.name.substring(
                          0,
                          widget.i.name.length < 27
                              ? widget.i.name.length
                              : 27),
                      style: GoogleFonts.courgette(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.i.status,
                      style: GoogleFonts.oleoScript(
                        fontSize: 18,
                        color: widget.i.status == "Dead"
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
