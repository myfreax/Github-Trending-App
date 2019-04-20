import 'package:flutter/material.dart';
import 'package:GTA/models/repos.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:GTA/repos.dart';
import 'package:GTA/views/repo.dart';

class ReposWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ReposModel>(
      builder: (buildContext, widget, reposModel) {
        Repos repos = reposModel.repos;

        if (repos != null && reposModel.isLoading == false) {
          List<Widget> list = [];
          for (var i = 0; i < repos.items.length; i++) {
            list.add(buildRepo(repos.items[i]));
            if (i < repos.items.length - 1) {
              list.add(Divider());
            }
          }
          if (list.isEmpty) {
            return Center(
              child: Text('404 Not Foud'),
            );
          }
          return ListView(children: list);
        }
        // when load data eroor
        if (reposModel.loadErrorMsg != '') {
          return Center(child: Text(reposModel.loadErrorMsg));
        }
        // By default, show a loading spinner
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
