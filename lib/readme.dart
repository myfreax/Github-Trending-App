import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:github_trend/github_trend.dart';

Future fetchReadme(Repo repo) async{
  // repo.url+ '/blob/master/README.md'
  var response = await http.get(repo.url);
  Document document = parse(response.body);
  if (document.querySelector('#readme') != null) {
    document.body.classes.forEach( (classname) => document.body.classes.remove(classname));
    document.body.innerHtml = document.querySelector('#readme article').outerHtml;
    RegExp exp = new RegExp(r"^http|^//");
    document.querySelectorAll('body img').forEach((img){
      String src = img.attributes['src'];
      if (src != null && !exp.hasMatch(src)) {
        img.attributes['src'] = 'https://github.com'+img.attributes['src'];  
      }
    });
  }
  return document;
}