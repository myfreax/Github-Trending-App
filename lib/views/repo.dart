import 'package:flutter/material.dart';
import '../repo.dart';

Widget buildRepo(Repo repo) {
  final double iconSize = 12;
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        Row(children: <Widget>[
          Expanded(
              child: Text(
            repo.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
        ]),
        Padding(
            child: Row(children: <Widget>[
              Expanded(
                  child: Text(
                repo.description,
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
                  Text(repo.language)
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
                  Text(repo.star.toString())
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
                  Text(repo.fork.toString())
                ],
              ),
            ]),
            // Column(children: <Widget>[
            //   Row(
            //     children: <Widget>[
            //       Icon(Icons.star, size: iconSize),
            //       Text(repo.todayStars.toString() + ' stars today')
            //     ],
            //   ),
            // ]),
          ],
        )
      ],
    ),
  );
}
