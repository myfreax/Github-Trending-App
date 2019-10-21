import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final String loginErrMsg;
  final bool loading;
  final void Function({@required String username, @required String password})
      login;

  LoginForm(
      {Key key,
      @required this.login,
      @required this.loading,
      @required this.loginErrMsg})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return LoginFormState(login: login);
  }
}

class LoginFormState extends State<LoginForm> {
  final void Function({@required String username, @required String password})
      login;
  LoginFormState({Key key, @required this.login}) : super();
  final passwdCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameCtrl.dispose();
    passwdCtrl.dispose();
    super.dispose();
  }

  _submit() {
    if (usernameCtrl.text.isEmpty) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Username Cannot Be Empty'),
          );
        },
      );
    }

    if (passwdCtrl.text.isEmpty) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password Cannot Be Empty'),
          );
        },
      );
    }
    login(username: usernameCtrl.text, password: passwdCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                controller: usernameCtrl,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username OR Email',
                ),
              ),
            ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                controller: passwdCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
          ]),
        ),
        FlatButton(
          child: Text('Login'),
          onPressed: _submit,
        ),
      ],
    );
  }
}
