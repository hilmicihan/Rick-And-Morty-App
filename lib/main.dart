import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rick_and_mrty_app/data/characterData.dart';
import 'package:rick_and_mrty_app/data/serviceFunctions.dart';
import 'package:rick_and_mrty_app/screens/ScreenInfo.dart';
import 'package:rick_and_mrty_app/screens/ScreenLoading.dart';
import 'package:rick_and_mrty_app/screens/listScreens.dart';
import 'package:rick_and_mrty_app/utils/constant.dart';
import 'package:rick_and_mrty_app/utils/searchUtil.dart';
import 'package:rick_and_mrty_app/utils/widgetUtils.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: SearchCharacter());
                  })
            ],
            title: Text("Rick and Morty App"),
          ),
          body: listOfScreens[index],
          drawer: Drawer(),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: infoBackround),
              width: MediaQuery.of(context).size.width * 0.4,
              height: 38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.stream),
                    color: index == 0
                        ? Color(0xFFFFCD00)
                        : Colors.grey, // when pressed it will return yellow
                    onPressed: () {
                      setState(() {
                        index = 0;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    color: index == 1
                        ? Color(0xFFFFCD00)
                        : Colors.grey, // when pressed it will return yellow
                    onPressed: () {
                      setState(
                        () {
                          index = 1;
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.skullCrossbones),
                    color: index == 2
                        ? Color(0xFFFFCD00)
                        : Colors.grey, // when pressed it will return yellow
                    onPressed: () {
                      setState(
                        () {
                          index = 2;
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.firstAid),
                    color: index == 3
                        ? Color(0xFFFFCD00)
                        : Colors.grey, // when pressed it will return yellow
                    onPressed: () {
                      setState(
                        () {
                          index = 3;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenCharacterList extends StatefulWidget {
  const ScreenCharacterList({Key key}) : super(key: key);

  @override
  _ScreenCharacterListState createState() => _ScreenCharacterListState();
}

class _ScreenCharacterListState extends State<ScreenCharacterList> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CharacterInfo currentItem;

    if (data == null) {
      updateCharacterData().then((data2) {
        setState(() {
          data = "data";
        });
      });
      return LoadingMain();
    } else {
      return SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              for (var i in characterArr) ListElement(i: i),
            ],
          ),
        ),
      );
    }
  }
}

class ListElement extends StatefulWidget {
  const ListElement({
    Key key,
    @required this.i,
  }) : super(key: key);

  final CharacterInfo i;

  @override
  _ListElementState createState() => _ListElementState();
}

class _ListElementState extends State<ListElement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: infoBackround,
        ),
        child: Row(
          children: [
            GestureDetector(
              child: SmallInfoPart(i: widget.i),
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
            ),
            Spacer(),
            IconButton(
                icon: Icon(Icons.favorite,
                    color: widget.i.iconPressed ? Colors.red : Colors.white),
                onPressed: () {
                  setState(() {
                    widget.i.iconPressed = !widget.i.iconPressed;
                    if (widget.i.iconPressed)
                      likedCharacterArr.add(widget.i);
                    else
                      likedCharacterArr.remove(widget.i);
                  });
                }),
          ],
        ),
      ),
    );
  }
}
