import 'package:GTA/pages/home/containers/drawer_container.dart';
import 'package:GTA/pages/home/containers/languges_container.dart';
import 'package:GTA/pages/home/containers/repos_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final void Function() onInit;

  HomePage({Key key, @required this.onInit});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerContainer(),
      appBar: AppBar(
        title: Text('Github Trending'),
      ),
      endDrawer: Drawer(child: LangugesContainer()),
      // floatingActionButton: ReFleshRepos(),
      body: ReposContainer(),
    );
  }
}
