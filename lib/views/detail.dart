import 'package:flutter/material.dart';

class RepoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Center(
              child: Text('data'),
            )
          ],
        ),
        appBar: AppBar(
          title: Text('仓库的名称'),
        ));
  }
}
