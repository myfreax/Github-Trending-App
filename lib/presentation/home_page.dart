import 'package:GTA/containers/app_languges.dart';
import 'package:GTA/containers/app_repos.dart';
import 'package:GTA/containers/reflesh_repos.dart';
import 'package:flutter/material.dart';
import 'package:GTA/routes.dart';

class HomePage extends StatefulWidget {
  final void Function() onInit;

  HomePage({Key key, @required this.onInit});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              onTap: () => Navigator.of(context).pushNamed(Routes.login),
              title: Text('login'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Github Trending'),
      ),
      endDrawer: Drawer(child: AppLanguages()),
      floatingActionButton: ReFleshRepos(),
      body: AppRepos(),
    );
  }
}
