import 'package:GTA/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String username;
  AppDrawer(this.username);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: GestureDetector(
              onTap:(){
                if (username.isEmpty) {
                  Navigator.of(context).pushNamed(Routes.login);  
                }
              },
              child: CircleAvatar(
                child: Text(username.isEmpty ? 'Login' : username),
              ),
            ),
          ),
          ListTile(
            onTap: (){
              if (username.isEmpty) {
                Navigator.of(context).pushNamed(Routes.login);
              }else{
                Navigator.of(context).pushNamed(Routes.stars);
              }
            },
            title: Center(
              child: Text('Stars'),
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
