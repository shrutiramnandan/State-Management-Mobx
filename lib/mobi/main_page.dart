import 'package:bloc_demo/mobi/posts_list_page.dart';
import 'package:bloc_demo/mobi/users_list_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MobX API Demo"),
        // bottom: TabBar(
        //   controller: _tabController,
        //   tabs: <Widget>[
        //     Tab(
        //       text: 'Posts',
        //     ),
        //     Tab(
        //       text: 'Users',
        //     )
        //   ],
        // ),
      ),
      body: 
      UserListPage()
      // SafeArea(
      //   child: TabBarView(
      //     controller: _tabController,
      //     children: <Widget>[
      //       PostListPage(),
      //       UserListPage(),
      //     ],
      //   ),
      // )
    );
  }
}