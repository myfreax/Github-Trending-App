import 'package:GTA/models/repos.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:github_trend/github_trend.dart';
import 'package:GTA/views/repo.dart';
import 'package:package_info/package_info.dart';
import 'package:html/dom.dart' as DOM;
import 'package:flutter/material.dart';

Future<List<String>> fetchLanguages() async {
  GithubTrend githubTrend = GithubTrend();
  DOM.Document document = await githubTrend.fetchTrending();
  return Languages(document).list;
}

Future<PackageInfo> fetchPackageInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo;
}

class ListsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ScopedModelDescendant<ReposModel>(
        builder: (buildContext, widget, reposModel) {
          // when load data eroor
          if (reposModel.loadErrorMsg != '') {
            return Center(child: Text(reposModel.loadErrorMsg));
          }

          List<Repo> repos = reposModel.repos;
          if (repos.isEmpty) {
            return Center(
                child: Text('It looks like we don’t have any trending repositories for ${reposModel.language}.'),
              );
          }
          
          if (repos.isNotEmpty && reposModel.isLoading == false) {
            List<Widget> list = [];
            for (var i = 0; i < repos.length; i++) {
              list.add(buildRepo(repos[i], buildContext));
              if (i < repos.length - 1) {
                list.add(Divider());
              }
            }
            return ListView(children: list);
          }
          
          // By default, show a loading spinner
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
