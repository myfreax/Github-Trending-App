import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'dart:async';

class DetailView extends StatefulWidget {
  final void Function() onInit;

  DetailView({Key key, @required this.onInit}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailState();
  }
}

class DetailState extends State<DetailView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  DetailState();

  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String contentBase64 = base64Encode(const Utf8Encoder().convert('html'));
    return Scaffold(
        body: WebView(
            initialUrl: 'data:text/html;base64,$contentBase64',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            }),
        appBar: AppBar(
          title: Text('repo.name'),
        ));
  }
}
