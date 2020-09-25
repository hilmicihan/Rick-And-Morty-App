import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_mrty_app/data/characterData.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rick_and_mrty_app/main.dart';

class InfoScreen extends StatefulWidget {
  CharacterInfo character;
  InfoScreen({this.character});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff32474D),
        title: Text("Character info"),
      ),
      backgroundColor: Color(0xffD7DBDD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: widget.character.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.3,
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
            ],
          ),
          BasicInfoCard(
            width: width,
            text: widget.character.name,
            iconColumn: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Icon(Icons.portrait), Text("id")],
            ),
          ),
          BasicInfoCard(
            width: width,
            text: widget.character.status,
            iconColumn: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FaIcon(widget.character.status == "Dead"
                    ? FontAwesomeIcons.skullCrossbones
                    : FontAwesomeIcons.swimmer),
                Text("Stat")
              ],
            ),
          ),
          BasicInfoCard(
            width: width,
            text: widget.character.location,
            iconColumn: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Icon(Icons.location_on), Text("Seen")],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoScreen2 extends StatefulWidget {
  CharacterInfo character;
  InfoScreen2({this.character});

  @override
  _InfoScreen2State createState() => _InfoScreen2State();
}

class _InfoScreen2State extends State<InfoScreen2> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffD7DBDD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: widget.character.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.3,
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
            ],
          ),
          BasicInfoCard(
            width: width,
            text: widget.character.name,
            iconColumn: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Icon(Icons.portrait), Text("id")],
            ),
          ),
          BasicInfoCard(
            width: width,
            text: widget.character.status,
            iconColumn: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FaIcon(widget.character.status == "Dead"
                    ? FontAwesomeIcons.skullCrossbones
                    : FontAwesomeIcons.swimmer),
                Text("Stat")
              ],
            ),
          ),
          BasicInfoCard(
            width: width,
            text: widget.character.location,
            iconColumn: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Icon(Icons.location_on), Text("Seen")],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class BasicInfoCard extends StatelessWidget {
  const BasicInfoCard({
    Key key,
    @required this.width,
    @required this.text,
    @required this.iconColumn,
  }) : super(key: key);

  final double width;
  final String text;
  final Column iconColumn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Container(
        height: 45,
        width: width * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff49DFE3),
        ),
        child: Row(
          children: [
            SizedBox(
              width: width * 0.08,
            ),
            iconColumn,
            SizedBox(width: 20),
            Text(text),
          ],
        ),
      ),
    );
  }
}
