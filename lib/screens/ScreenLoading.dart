import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingMain extends StatefulWidget {
  LoadingMain({Key key}) : super(key: key);

  @override
  _LoadingMainState createState() => _LoadingMainState();
}

class _LoadingMainState extends State<LoadingMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [for (int i = 0; i < 20; i++) loadingCard()],
        ),
      ),
    );
  }
}

Widget loadingCard() {
  return Card(
    elevation: 1,
    child: Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  );
}
