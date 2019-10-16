import 'package:github_trend/github_trend.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:html/dom.dart';

class ReposModel extends Model {
  bool isLoading = true;
  List<Repo>repos;
  GithubTrend githubTrend;
  String loadErrorMsg = '';
  String language = 'all';

  ReposModel(){
    githubTrend = GithubTrend();
  }

  void initState() async {
    await fetchRepos();
  }

  void fetchRepos() async {
    isLoading = true;
    notifyListeners();
    try {
      Document document = await githubTrend.fetchTrending(language: language,since: Since.daily);
      repos = Repos(document).list;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      loadErrorMsg = e.message;
      notifyListeners();
    }
  }
}

// class ReposModel extends Model {
//   bool isLoading = true;
//   String language = 'all';
//   Repos repos;
//   GithubTrend githubTrend;
//   String loadErrorMsg = '';

//   ReposModel() {
//     githubTrend = GithubTrend();
//   }

//   void initState() async {
//     await fetchRepos();
//   }

//   void fetchRepos({String since: 'daily'}) async {
//     isLoading = true;
//     notifyListeners();
//     final reposList =
//         await githubTrend.fetchRepos(language: language, since: since);
//     if (githubTrend.response.statusCode == 200) {
//       Map<String, dynamic> res = {};
//       res['items'] = reposList;
//       res['total'] = reposList.length;
//       repos = Repos.fromJson(res);
//       isLoading = false;
//       notifyListeners();
//     } else {
//       throw Exception('load data fail');
//     }
//   }
// }
