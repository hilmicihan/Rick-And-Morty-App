import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_mrty_app/data/characterData.dart';

class SmallInfoPart extends StatefulWidget {
  SmallInfoPart({this.i});
  final CharacterInfo i;
  @override
  _SmallInfoPartState createState() => _SmallInfoPartState();
}

class _SmallInfoPartState extends State<SmallInfoPart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                widget.i.name.substring(
                    0, widget.i.name.length < 27 ? widget.i.name.length : 27),
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
                  color: widget.i.status == "Dead" ? Colors.red : Colors.green,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget SearchInfo(CharacterInfo character) {
  return Row(
    children: [
      SizedBox(
        width: 50,
      ),
      CachedNetworkImage(
        imageUrl: character.imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      SizedBox(
        width: 20,
      ),
      Column(
        children: [
          Text(character.name),
          Text(character.status),
        ],
      )
    ],
  );
}
