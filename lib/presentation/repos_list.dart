import 'package:GTA/presentation/repo_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_trend/github_trend.dart';
import 'package:GTA/containers/app_loading.dart';

class ReposList extends StatelessWidget {
  final List<Repo> repos;

  ReposList({Key key, @required this.repos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLoading(builder: (context, loading) {
      return loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildListView();
    });
  }

  _buildListView() {
    if (repos.isNotEmpty) {
      List<Widget> list = [];
      for (var i = 0; i < repos.length; i++) {
        list.add(RepoItem(
          repo: repos[i],
        ));
        if (i < repos.length - 1) {
          list.add(Divider());
        }
      }
      return ListView(children: list);
    } else {
      return Center(
        child: Text(
            'It looks like we don’t have any trending repositories for language.'),
      );
    }
  }
}
