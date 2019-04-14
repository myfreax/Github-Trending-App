import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'repos.dart';
import 'views/repo.dart';

const String URL =
    'https://api.github.com/search/repositories?sort=starts&order=desc&q=created:2019-04-03';

void main(List<String> args) {
  runApp(MyApp());
}

Future<Repos> fetchRepos() async {
  final reponse = await http.get(URL);
  if (reponse.statusCode == 200) {
    return Repos.fromJson(jsonDecode(reponse.body));
  } else {
    throw Exception('load data fail');
  }
}

class MyappState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('All'),
                onTap: () {
                  // change app state...
                  // StepState();
                  Navigator.pop(context); // close the drawer
                },
              ),
              Divider(),
              ListTile(
                title: Text('Rust'),
                onTap: () {
                  // change app state...
                  // StepState();
                  Navigator.pop(context); // close the drawer
                },
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              AboutListTile(
                child: Text('About'),
                icon: Icon(Icons.help),
                applicationIcon: Icon(Icons.trending_up),
                applicationName: 'GTA',
                applicationVersion: '0.1.0',
                applicationLegalese: 'Github Trending app built with Flutter',
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Github trending'),
          actions: <Widget>[
            Builder(builder: (context){
              return Padding(
                child: IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
                padding: EdgeInsets.only(right: 0));
            },),
            
          ],
        ),
        body: FutureBuilder(
          future: fetchRepos(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
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
        },),
      ),
    );
  }
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyappState();
  }
}
