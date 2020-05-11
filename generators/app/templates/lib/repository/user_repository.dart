import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutterdemo/model/github_user.dart';

class GithubUserRepository {
  Future<GithubUserResult> search(String keyword) async {
    http.Response response =
        await http.get("https://api.github.com/search/users?q=$keyword&page=1");
    if (response.statusCode == HttpStatus.ok) {
      return GithubUserResult.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
