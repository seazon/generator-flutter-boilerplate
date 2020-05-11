import 'package:flutter/material.dart';
import 'package:flutterdemo/model/github_user.dart';
import 'package:flutterdemo/viewmodel/github_user_list_viewmodel.dart';
import 'package:provider/provider.dart';

class GithubUserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<GithubUserListPage> {
  TextEditingController _controller;
  GithubUserListViewModel vm;

  @override
  void initState() {
    super.initState();
    String keyword = "wcl";
    Provider.of<GithubUserListViewModel>(context, listen: false)
        .search(keyword);
    _controller = TextEditingController(text: keyword);
  }

  @override
  Widget build(BuildContext context) {
    print("start build ");
    vm = Provider.of<GithubUserListViewModel>(context);
    return Scaffold(
        appBar: AppBar(title: Text("Search Github User")),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      vm.search(value);
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              Offstage(
                offstage: !vm.isLoading,
                child: CircularProgressIndicator(),
              ),
              Expanded(
                  child: RefreshIndicator(
                onRefresh: vm.refresh,
                child: _UserList(users: vm.users),
              ))
            ])));
  }
}

class _UserList extends StatelessWidget {
  final List<GithubUserResultItem> users;

  _UserList({this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.users.length,
      itemBuilder: (context, index) {
        final user = this.users[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(user.avatar_url)),
                borderRadius: BorderRadius.circular(6)),
            width: 50,
            height: 100,
          ),
          title: Text(user.login),
        );
      },
    );
  }
}
