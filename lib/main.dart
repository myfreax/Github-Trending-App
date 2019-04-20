import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:GTA/models/repos.dart';
import 'package:GTA/views/repos.dart';
import 'package:github_trend/github_trend.dart';
import 'package:package_info/package_info.dart';

void main(List<String> args) async {
  ReposModel reposModel = ReposModel();
  await reposModel.initState();
  runApp(ScopedModel<ReposModel>(
    child: MyApp(),
    model: reposModel,
  ));
}

Future<List<String>> fetchLanguages() async {
  GithubTrend githubTrend = GithubTrend();
  List<String> languages = await githubTrend.fetchLanguages();
  return languages;
}

Future<PackageInfo> fetchPackageInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo;
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyappState();
  }
}

class MyappState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: ScopedModelDescendant<ReposModel>(
          builder: (context, widget, reposModel) {
            return FloatingActionButton(
              onPressed: () {
                reposModel.fetchRepos();
              },
              tooltip: 'refresh',
              child: Icon(Icons.refresh),
            );
          },
        ),
        endDrawer: Drawer(
          child: FutureBuilder(
              future: fetchLanguages(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Widget> languagesWidget = [];
                  for (var i = 0; i < snapshot.data.length; i++) {
                    languagesWidget.add(ListTile(
                      // TODO Add icon for languages
                      // leading: const Icon(FontAwesomeIcons.gamepad),
                      title: Text(snapshot.data[i]),
                      onTap: () {
                        Navigator.pop(context); // close the drawer
                        ReposModel reposModel =
                            ScopedModel.of<ReposModel>(context);
                        reposModel.language =
                            snapshot.data[i] == 'Unknown languages'
                                ? 'unknown'
                                : snapshot.data[i];
                        reposModel.fetchRepos();
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
          child: FutureBuilder(
              future: fetchPackageInfo(),
              builder: (BuildContext context, AsyncSnapshot<PackageInfo> info) {
                if (info.hasData) {
                  return ListView(
                    children: <Widget>[
                      AboutListTile(
                        child: Text('About'),
                        icon: Icon(Icons.help),
                        applicationIcon: Icon(Icons.trending_up),
                        applicationName: info.data.appName,
                        applicationVersion: info.data.version,
                        applicationLegalese:
                            'Github Trending app built with Flutter',
                      )
                    ],
                  );
                } else if (info.hasError) {
                  return Center(child: Text("${info.error}"));
                }
                return Center(child: CircularProgressIndicator());
              }),
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
        body: ReposWidget(),
      ),
    );
  }
}
