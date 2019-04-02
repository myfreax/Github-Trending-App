import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main(List<String> args) {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double iconSize = 12;
    Widget buildRepo(
        {String title = '', int stars = 0, int forks = 0, String desc = ''}) {
      return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                  child: Text(
                '996icu / 996.ICU',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
            ]),
            Padding(
                child: Row(children: <Widget>[
                  Expanded(
                      child: Text(
                    'Repo for counting stars and contributing. Press F to pay. contri',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
                ]),
                padding: EdgeInsets.only(top: 5, bottom: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.language, size: iconSize),
                      Text('Rust')
                    ],
                  ),
                ]),
                Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        size: iconSize,
                      ),
                      Text('1234565')
                    ],
                  ),
                ]),
                Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.call_split,
                        size: iconSize,
                      ),
                      Text('1234565')
                    ],
                  ),
                ]),
                Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, size: iconSize),
                      Text('1117 stars today')
                    ],
                  ),
                ]),
              ],
            )
          ],
        ),
      );
    }

    List<Widget> repos = [];
    int length = 20;
    for (var i = 0; i < length; i++) {
      repos.add(buildRepo());
      if (i < length -1) {
        repos.add(Divider());  
      }
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Github Trend')),
        body: ListView(
          children: repos,
        ),
      ),
    );
  }
}
