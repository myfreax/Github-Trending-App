import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:GTA/repo.dart';
import 'package:http/http.dart' as http;
// var url = 'http://example.com/whatsit/create';
// var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});


const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<p>
The navigation delegate is set to block navigation to the youtube website.
</p>
<ul>
<ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
<ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
</ul>
</body>
</html>
''';

final String contentBase64 = base64Encode(const Utf8Encoder().convert(kNavigationExamplePage));

class RepoDetail extends StatelessWidget {
  final Repo repo;
  RepoDetail(this.repo);
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(builder: (BuildContext context) {
          return WebView(
              initialUrl: 'data:text/html;base64,$contentBase64',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              });
        }),
        appBar: AppBar(
          title: Text(repo.name),
        ));
  }
}
