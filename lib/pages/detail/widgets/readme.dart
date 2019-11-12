import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Readme extends StatelessWidget {
  final bool loading;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final String html;

  Readme({Key key, @required this.html, @required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (html.isNotEmpty) {
      String contentBase64 = base64Encode(const Utf8Encoder().convert(html));
      return WebView(
          initialUrl: 'data:text/html;base64,$contentBase64',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          });
    } else {
      return Center(
        child: Text('404 Not Found'),
      );
    }
  }
}
