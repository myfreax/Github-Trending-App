import 'package:GTA/actions/actions.dart';
import 'package:GTA/models/models.dart';
import 'package:GTA/selectors/selectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ReFleshRepos extends StatelessWidget {

  ReFleshRepos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(converter: (store) {
      return () => store.dispatch(LoadReposAction(
          language: languageSelector(store.state),
          since: sinceSelector(store.state)));
    }, builder: (context, callback) {
      return new FloatingActionButton(
        onPressed: callback,
        tooltip: 'reflesh',
        child: new Icon(Icons.add),
      );
    });
  }
}
