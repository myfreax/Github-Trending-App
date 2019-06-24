import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:GTA/repo.dart';


Future fetchReadme(Repo repo) async{
  // repo.url+ '/blob/master/README.md'
  var response = await http.get(repo.url+ '/blob/master/README.md');
  Document document = parse(response.body);
  if (document.querySelector('#readme') != null) {
    document.querySelector('body').innerHtml = document.querySelector('#readme').outerHtml;
    document.querySelectorAll('body img').forEach((img){
      // TODO 图片已经加入其它url的情况
      img.attributes['src'] = 'https://github.com'+img.attributes['src'] ;
    });
  }
  return document;
}