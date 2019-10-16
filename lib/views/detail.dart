import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:GTA/readme.dart';
import 'package:github_trend/github_trend.dart';

class RepoDetail extends StatelessWidget {
  final Repo repo;
  RepoDetail(this.repo);
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: fetchReadme(repo),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                String contentBase64 = base64Encode(
                const Utf8Encoder().convert(snapshot.data.outerHtml));
                return WebView(
                    initialUrl: 'data:text/html;base64,$contentBase64',
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
              return Center(child: CircularProgressIndicator());
            }),
        appBar: AppBar(
          title: Text(repo.name),
        ));
  }
}
