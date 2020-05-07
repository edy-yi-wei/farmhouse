import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:superhero_app/podo/cage.dart';
import 'package:superhero_app/widget/barn_detail_widget.dart';

class BarnDetail extends StatefulWidget {
//  final title;
//  final id;
//  final img;
//  final name;

//  BarnDetail({Key key, this.title, this.id, this.img, this.name})
//      : super(key: key);
  BarnDetail({Key key}): super(key: key);

  @override
  _BarnDetailState createState() => _BarnDetailState();
}

class _BarnDetailState extends State<BarnDetail> {
  bool _loading;
  Cage cage;

  getCage() async {
    setState(() {
      _loading = true;
    });
//    var url = 'https://akabab.github.io/superhero-api/api/id/${widget.id}.json';
//    var res = await http.get(url);
//    http.Response response = await http.get(url);
    String data = '{"cageId": 1, "cageName": "Kandang 1", "populationPlus": 2, "populationMinus": 1, "populationTotal": 35, "feed": 15, "eggProduction": 120}';
    var decodedJson = jsonDecode(data);
    setState(() {
      cage = Cage.fromJson(decodedJson);
      _loading = false;
    });
//    print(decodedJson);
//    int code = response.statusCode;
//    if (code == 200) {
//      setState(() {
//        heroItem = HeroItem.fromJson(decodedJson);
//        _loading = false;
//      });
//    } else {
//      print("Something went wrong");
//    }
  }

  @override
  void initState() {
    super.initState();
    getCage();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
                title: Text(this.cage.cageName),
                bottom: TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.sms), text: 'Summary'),
                      Tab(icon: Icon(Icons.ac_unit), text: 'Populasi'),
                      Tab(text: 'Pakan'),
                      Tab(text: 'Produksi')
                    ]
                ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            body: _loading? Center(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor))
            )
            : BarnDetailWidget(cageId: cage.cageId, cageName: cage.cageName, populationPlus: cage.populationPlus, populationMinus: cage.populationMinus, populationTotal: cage.populationTotal, feed: cage.feed, eggProduction: cage.eggProduction)
        )
    );
  }
}
