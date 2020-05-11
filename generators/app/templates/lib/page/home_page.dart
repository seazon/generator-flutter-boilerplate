import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

import 'github_user_list_page.dart';
import 'package:flutterdemo/page/tab_page.dart';
import 'package:flutterdemo/viewmodel/github_user_list_viewmodel.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  Map<String, String> map = Map();

  @override
  void initState() {
    handleDeeplink();
    super.initState();
  }

  void handleDeeplink() {
    getInitialUri().then((Uri url) {
      print('URL received: $url');
      if (url != null && url.scheme == 'poc') {
        map.addAll(url.queryParameters);
        if (url.path == '/github_user') {
          gotoGithubListPage();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text("1. Tab"),
            onTap: () {
              gotoTabPage();
            },
          ),
          ListTile(
            title: Text("2. MVVM & Http"),
            onTap: () {
              gotoGithubListPage();
            },
          ),
        ],
      ),
    );
  }

  void gotoTabPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TabPage()));
  }

  void gotoGithubListPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChangeNotifierProvider(
        create: (context) => GithubUserListViewModel(),
        child: GithubUserListPage(),
      );
    }));
  }
}
