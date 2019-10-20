import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LanguagesList extends StatelessWidget {
  final void Function(String language) toggleLanguage;
  final List<String> languages;
  final String languagesErrMsg;

  LanguagesList(
      {Key key,
      @required this.languages,
      @required this.toggleLanguage,
      @required this.languagesErrMsg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> languagesWidget = [];
    for (var i = 0; i < languages.length; i++) {
      languagesWidget.add(ListTile(
        title: Text(i == 0 ? languages[i].toUpperCase() : languages[i]),
        onTap: () {
          toggleLanguage(languages[i]);
          Navigator.pop(context); // close the drawer
        },
      ));
      if (i < languages.length - 1) {
        languagesWidget.add(Divider());
      }
    }
    return ListView(children: languagesWidget);
  }
}
