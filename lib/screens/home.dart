import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:superhero_app/screens/settings.dart';
import 'package:superhero_app/screens/dashboard.dart';
import 'package:superhero_app/screens/cage_master_list.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = false;
  int _menuIndex = 0;
  List<Widget> _children = [
    Dashboard(title: "Dashboard"),
    CageMasterList(title: "Master Kandang"),
    Text('Input'),
    Text('Report'),
    Text('Setting')
  ];
  List<BottomNavigationBarItem> _menuItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.note),
        title: Text('Master')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Input')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Report')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Setting')
    )
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "${widget.title.toUpperCase()}",
          style: TextStyle(
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
//                    showSearch(
//                      context: context,
//                      delegate: HeroSearch(all: responseList),
//                    );
            },
            tooltip: "Search",
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              var router =
                  new MaterialPageRoute(builder: (BuildContext context) {
                return Settings(
                  title: widget.title,
                );
              });

              Navigator.of(context).push(router);
            },
            tooltip: "Search",
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
              ),
            )
          : _children[_menuIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onMenuTap,
          currentIndex: _menuIndex,
          items: _menuItems
      ),
    );
  }

  void onMenuTap(int index){
    setState(() {
      _menuIndex = index;
    });
  }
}
