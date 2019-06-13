import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:GTA/models/repos.dart';
import 'package:GTA/views/lists.dart';

void main(List<String> args) async {
  ReposModel reposModel = ReposModel();
  await reposModel.initState();
  runApp(ScopedModel<ReposModel>(
    child: MyApp(),
    model: reposModel,
  ));
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
      initialRoute: '/',
      routes: {
        // 当导航到/路由时就会构建ListsWidget
        '/': (context) => ListsWidget(),
      },
    );
  }
}
