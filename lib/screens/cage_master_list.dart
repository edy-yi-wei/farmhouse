import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:superhero_app/widget/cage_master_list_widget.dart';

class CageMasterList extends StatefulWidget {
  final String title;
  CageMasterList({Key key, this.title}) : super(key: key);

  @override
  _CageMasterListState createState() => _CageMasterListState();
}

class _CageMasterListState extends State<CageMasterList> {
  List cageList;
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

    String cages = '[{"cageId": 1, "cageName": "Kandang 1", "notes": "Ayam dewasa"},'
        '{"cageId": 2, "cageName": "Kandang 2", "notes": "Ayam remaja"},'
        '{"cageId": 3, "cageName": "Kandang 3", "notes": "Anak ayam"}]';

    List decodedJson = jsonDecode(cages);
    setState(() {
      cageList = decodedJson;
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
      child: CageMasterListWidget(cageList),
    );
  }
}