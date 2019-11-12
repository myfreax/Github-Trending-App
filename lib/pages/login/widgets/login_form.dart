import 'package:GTA/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final String loginMsg;
  final bool loading;
  final void Function({@required String username, @required String password})
      login;

  LoginForm(
      {Key key,
      @required this.login,
      @required this.loading,
      @required this.loginMsg})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print('login form: createState');
    return LoginFormState(login: login, loading: loading, loginMsg: loginMsg);
  }
}

class LoginFormState extends State<LoginForm> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _username;
  String _password;

  String loginMsg;
  bool loading;
  final void Function({@required String username, @required String password})
      login;

  LoginFormState(
      {Key key,
      @required this.login,
      @required this.loading,
      @required this.loginMsg});

  @override
  initState() {
    print('login form: initState');
    super.initState();
  }

  @override
  didChangeDependencies() {
    print('login form: didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(LoginForm oldWidget) {
    if (oldWidget.loading != widget.loading) {
      loading = widget.loading;
      loginMsg = widget.loginMsg;
    }
    super.didUpdateWidget(oldWidget);
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      login(username: _username, password: _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('login form: build');
    if (loading) {
      return Dialog(
          child: Center(
        child: Text('在正登录....'),
      ));
    }

    if (loginMsg == 'success') {
      return AlertDialog(
        title: Text('Github'),
        content: Text(loginMsg),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.home);
            },
            child: Text('Go Home'),
          )
        ],
      );
      // Navigator.maybePop(context);
    }

    if (loginMsg.isNotEmpty) {
      return AlertDialog(
        title: Text('Error'),
        content: Text(loginMsg),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              setState(() {
                loading = false;
                loginMsg = '';
              });
            },
            child: Text('确定'),
          )
        ],
      );

      /// return Dialog(child: Text(loginMsg));
    } else {
      return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(children: <Widget>[
                Expanded(
                  child: TextFormField(
                    key: Key('__username__'),
                    validator: (val) {
                      return val.trim().isEmpty
                          ? 'username can not be empty'
                          : null;
                    },
                    onSaved: (value) => _username = value,
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
                  child: TextFormField(
                    key: Key('__password__'),
                    validator: (val) {
                      return val.trim().isEmpty
                          ? 'password can not be empty'
                          : null;
                    },
                    onSaved: (value) => _password = value,
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
        ),
      );
    }
  }
}
