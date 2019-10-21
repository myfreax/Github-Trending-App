import 'package:GTA/containers/app_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(padding: EdgeInsets.all(10), child: AppLogin()),
    );
  }
}
