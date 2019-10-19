import 'package:GTA/containers/app_languges.dart';
import 'package:GTA/containers/app_repos.dart';
import 'package:GTA/containers/reflesh_repos.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final void Function() onInit;

  HomeView({Key key, @required this.onInit});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeView> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Trending'),
      ),
      endDrawer: AppLanguages(),
      floatingActionButton: ReFleshRepos(),
      body: AppRepos(),
    );
  }
}
