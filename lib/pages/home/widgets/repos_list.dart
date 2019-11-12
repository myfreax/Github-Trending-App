import 'package:GTA/pages/home/containers/repo_container.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_trend/github_trend.dart';

class ReposList extends StatelessWidget {
  final BuiltList<Repo> repos;
  final String language;
  final String errorMsg;
  final bool loadding;

  ReposList(
      {Key key,
      @required this.repos,
      @required this.language,
      @required this.errorMsg,
      @required this.loadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (errorMsg.isNotEmpty) {
      return Center(
        child: Text(errorMsg),
      );
    }
    if (loadding) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (repos.isNotEmpty) {
      List<Widget> list = [];
      for (var i = 0; i < repos.length; i++) {
        list.add(RepoContainer(
          repos[i],
        ));
        // list.add(Text('data'));
        if (i < repos.length - 1) {
          list.add(Divider());
        }
      }
      return ListView(children: list);
    } else {
      return Center(
        child: Text(
            'It looks like we don’t have any trending repositories for language ${language}.'),
      );
    }
  }
}
