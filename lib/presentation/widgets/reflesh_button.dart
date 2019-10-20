import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefleshButton extends StatelessWidget {
  final void Function() reflesh;

  RefleshButton({Key key, @required this.reflesh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: reflesh,
      tooltip: 'reflesh',
      child: new Icon(Icons.refresh),
    );
  }
}
