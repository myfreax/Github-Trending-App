import 'package:GTA/containers/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LanguagesList extends StatelessWidget {
  final List<String> languages;
  LanguagesList({Key key, this.languages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppLoading(
      builder: (context, loading) {
        return loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _buildLanguagesList();
      },
    );
  }

  _buildLanguagesList() {
    List<Widget> languagesWidget = [];
    for (var i = 0; i < languages.length; i++) {
      languagesWidget.add(ListTile(
        title: Text(i == 0 ? languages[i].toUpperCase() : languages[i]),
        onTap: () {},
      ));
      if (i < languages.length - 1) {
        languagesWidget.add(Divider());
      }
    }
    return Drawer(child: ListView(children: languagesWidget));
  }
}
