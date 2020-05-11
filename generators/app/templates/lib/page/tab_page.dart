import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/util/util_snackbar.dart';

class TabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TabPageState();
}

class TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: "tab 1",
    ),
    Tab(
      text: "tab 2",
    ),
    Tab(
      text: "tab 3",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, initialIndex: 0, length: myTabs.length);
    _tabController.addListener(() {
      print("tab tapped");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("tab"),
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  SnackBarUtil.show(context, "search menu tapped");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
            ),
            Icon(Icons.more_vert)
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: myTabs,
              ),
            ),
            TabBar(
              labelColor: Colors.lightGreen,
              controller: _tabController,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.camera_alt),
                  text: "Camera",
                ),
                Tab(
                  icon: Icon(Icons.chat),
                  text: "Chats",
                ),
                Tab(
                  icon: Icon(Icons.call),
                  text: "Call",
                )
              ],
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
