import 'package:github_trend/github_trend.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:GTA/repos.dart';

class ReposModel extends Model {
  bool isLoading = true;
  String language = 'all';
  Repos repos;
  GithubTrend githubTrend;
  String loadErrorMsg = '';

  ReposModel(){
   githubTrend = GithubTrend(); 
  }

  void initState() async {
    await fetchRepos();
  }


  void fetchRepos({String since: 'daily'}) async {
    isLoading = true;
    notifyListeners();
    // try {
      final reposList =
          await githubTrend.fetchRepos(language: language, since: since);
      if (githubTrend.response.statusCode == 200) {
        Map<String, dynamic> res = {};
        res['items'] = reposList;
        res['total'] = reposList.length;
        repos = Repos.fromJson(res);
        isLoading = false;
        notifyListeners();
      } else {
        throw Exception('load data fail');
      }
    // } catch (e) {
    //   print(e);
    //   loadErrorMsg = e.message;
    //   notifyListeners();
    // }
  }
}
