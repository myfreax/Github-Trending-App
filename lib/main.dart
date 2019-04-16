import 'package:flutter/material.dart';
import 'repos.dart';
import 'views/repo.dart';
import 'package:github_trend/github_trend.dart';

void main(List<String> args) {
  runApp(MyApp());
}

Future<Repos> fetchRepos(
    {String language: 'all', String since: 'daily'}) async {
  GithubTrend githubTrend = GithubTrend();
  final reposList =
      await githubTrend.fetchTrendingRepos(language: language, since: since);
  Map<String, dynamic> repos = {};
  if (githubTrend.response.statusCode == 200) {
    repos['items'] = reposList;
    repos['total'] = reposList.length;
    return Repos.fromJson(repos);
  } else {
    throw Exception('load data fail');
  }
}

Future<List<String>> fetchLanguages() async {
  GithubTrend githubTrend = GithubTrend();
  List<String> languages = await githubTrend.fetchLanguages();
  return languages;
}

class MyappState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        endDrawer: Drawer(
          child: FutureBuilder(
              future: fetchLanguages(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Widget> languagesWidget = [];
                  for (var i = 0; i < snapshot.data.length; i++) {
                    languagesWidget.add(ListTile(
                      // leading: const Icon(FontAwesomeIcons.gamepad),
                      title: Text(snapshot.data[i]),
                      onTap: () {
                        // change app state...
                        // StepState();
                        setState(() {
                          fetchRepos(language: snapshot.data[i]);
                        });
                        print(snapshot.data[i]);
                        Navigator.pop(context); // close the drawer
                      },
                    ));
                    if (i < snapshot.data.length - 1) {
                      languagesWidget.add(Divider());
                    }
                  }
                  return ListView(children: languagesWidget);
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }
                return Center(child: CircularProgressIndicator());
              }),
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
            Builder(
              builder: (context) {
                return Padding(
                    child: IconButton(
                      icon: Icon(Icons.filter_list),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                    padding: EdgeInsets.only(right: 0));
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: fetchRepos(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
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

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyappState();
  }
}
