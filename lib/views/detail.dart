import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      });
}

class RepoDetail extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(builder: (BuildContext context) {
          return WebView(
              initialUrl:
                  'https://github.com/fluttercommunity/flutter_webview_plugin/blob/master/README.md',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              javascriptChannels: <JavascriptChannel>[
                _toasterJavascriptChannel(context),
              ].toSet(),
              onPageFinished: (String url) {
                _controller.future.then((controller) {
                  controller.evaluateJavascript(
                      'document.querySelector("header").removeChild(document.querySelector("header div"));');
                });
                print('Page finished loading: $url');
              });
        }),
        appBar: AppBar(
          title: Text('仓库的名称'),
        ));
  }
}
