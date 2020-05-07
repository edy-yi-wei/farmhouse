import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:superhero_app/widget/dashboard_widget.dart';

class Dashboard extends StatefulWidget {
  final String title;
  Dashboard({Key key, this.title}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List responseList;
  bool _loading = false;

  getCages() async {
    setState(() {
      _loading = true;
    });
//    var url = 'https://akabab.github.io/superhero-api/api/all.json';
//    var res = await http.get(url);
//    List decodedJson = jsonDecode(res.body);

//    int code = res.statusCode;
//    if (code == 200) {
//      setState(() {
//        responseList = decodedJson;
//        _loading = false;
//      });
//    } else {
//      print("Something went wrong");
//      setState(() {
//        _loading = false;
//      });
//    }

    String cages = '[{"cageId": 1, "cageName": "Kandang 1", "populationPlus": 2, "populationMinus": 1, "populationTotal": 35, "feed": 15, "eggProduction": 120},'
        '{"cageId": 2, "cageName": "Kandang 2", "populationPlus": 8, "populationMinus": 3, "populationTotal": 67, "feed": 21, "eggProduction": 87},'
        '{"cageId": 3, "cageName": "Kandang 3", "populationPlus": 1, "populationMinus": 0, "populationTotal": 41, "feed": 7, "eggProduction": 13}]';

    List decodedJson = jsonDecode(cages);
    setState(() {
      responseList = decodedJson;
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCages();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DashboardWidget(responseList),
    );
  }
}