import 'package:flutter/cupertino.dart';

import 'package:flutterdemo/model/github_user.dart';
import 'package:flutterdemo/repository/user_repository.dart';

class GithubUserListViewModel extends ChangeNotifier {
  GithubUserRepository repository = GithubUserRepository();
  List<GithubUserResultItem> users = List<GithubUserResultItem>();
  String keyword = "";
  bool isLoading = false;

  Future<void> search(String keyword) async {
    this.keyword = keyword;
    users.clear();
    isLoading = true;
    notifyListeners();

    final results = await repository.search(keyword);
    users = results.items;
    print(users);
    isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    search(keyword);
    return;
  }
}
