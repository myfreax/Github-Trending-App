import 'package:GTA/containers/app_detail.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final void Function() onInit;
  final String title;

  DetailPage({Key key, @required this.onInit, @required this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailState(title);
  }
}

class DetailState extends State<DetailPage> {
  final String title;

  DetailState(this.title);

  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppDetail(),
        appBar: AppBar(
          title: Text(title),
        ));
  }
}
