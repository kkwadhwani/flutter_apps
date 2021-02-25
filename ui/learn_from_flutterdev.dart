import 'package:flutter/material.dart';
import 'package:intro/main.dart';

class NewApp extends StatelessWidget {
  const NewApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text("My New App"),
        ),
        body: ListView(
          children: [
            Image.asset(
              "images/final.jpg",
              width: 500,
              height: 240,
              fit: BoxFit.cover,
            ),
            tileSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

Widget tileSection = Container(
  padding: EdgeInsets.all(32.0),
  child: Row(
    children: [
      //1st element on row
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                "I am a  fist child of this column",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "I am a second child of this colun%",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),

      // Icon(
      //   Icons.star,
      //   color: Colors.red,
      // ),
      FavouteStar()
    ], //Row children
  ),
);

Column _buildButton(Color color, IconData icon, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: color,
      ),
      Container(
        margin: EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}

Widget buttonSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButton(Colors.grey, Icons.call, "Call"),
      _buildButton(Colors.grey, Icons.near_me, "Route"),
      _buildButton(Colors.grey, Icons.share, "Share"),
    ],
  ),
);

Widget textSection = Container(
  padding: EdgeInsets.all(40),
  child: Text(
    "This is a small paragraph in this app! I am really excited to learn about this. I want to learn more and make apps really quickly. I want to make a fully functional app",
    softWrap: true,
  ),
);









class FavouteStar extends StatefulWidget {
  // FavouteStar({Key key}) : super(key: key);

  @override
  _FavouteStarState createState() => _FavouteStarState();
}

class _FavouteStarState extends State<FavouteStar> {
  bool _isFavourited = true;
  int _favouriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(2),
          child: IconButton(
            padding: EdgeInsets.all(2),
            alignment: Alignment.centerRight,
            icon: (_isFavourited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red.shade500,
            onPressed: _toggleFavourite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text("$_favouriteCount"),
        )
      ],
    );
  }

  void _toggleFavourite() {
    setState(() {
      if (_isFavourited) {
        _favouriteCount -= 1;
        _isFavourited = false;
      } else {
        _favouriteCount += 1;
        _isFavourited = true;
      }
    });
  }
}
