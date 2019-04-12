import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'repos.dart';
import 'repo.dart';

const String URL =
    'https://api.github.com/search/repositories?sort=starts&order=desc&q=created:2019-04-03';

final double iconSize = 12;

void main(List<String> args) {
  runApp(MyApp(repos: fetchRepos()));
}

Widget buildRepo(Repo repo) {
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
                  Text(repo.stars.toString())
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
                  Text(repo.forks.toString())
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

Future<Repos> fetchRepos() async {
  final reponse = await http.get(URL);
  if (reponse.statusCode == 200) {
    return Repos.fromJson(jsonDecode(reponse.body));
  } else {
    throw Exception('load data fail');
  }
}


class MyApp extends StatelessWidget {
  final Future<Repos> repos;
  MyApp({Key key, this.repos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Github trending'),
        ),
        body: FutureBuilder(
          future: repos, 
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Widget> list = [];
              for (var i = 0; i < snapshot.data.items.length; i++) {
                list.add(buildRepo(snapshot.data.items[i]));
                if (i < snapshot.data.items.length - 1) {
                  list.add(Divider());
                }
              }
              return ListView(children: list);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
