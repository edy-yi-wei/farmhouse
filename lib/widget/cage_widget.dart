import 'package:flutter/material.dart';
import 'package:superhero_app/screens/barn_detail.dart';
import 'package:superhero_app/widget/superhero_avatar.dart';

class CageWidget extends StatelessWidget {
  var cageId;
  String cageName;
  var populationPlus;
  var populationMinus;
  var populationTotal;
  var feed;
  var eggProduction;

  CageWidget({
    Key key,
    @required this.cageId,
    @required this.cageName,
    @required this.populationPlus,
    @required this.populationMinus,
    @required this.populationTotal,
    @required this.feed,
    @required this.eggProduction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        var router = new MaterialPageRoute(builder: (BuildContext context) {
          return BarnDetail();
        });

        Navigator.of(context).push(router);
        print(cageName);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(cageName, style: textTheme.title)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("+ : $populationPlus"),
                                Text("- : $populationMinus"),
                                Text("Populasi Total : $populationTotal")
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            // color: Colors.indigo,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Pakan : "+feed.toString()),
                                Text("Produksi Telur : $eggProduction")
                              ],
                            ),
                          ),
                        )
                    ]),
                ]),
          ),
        )),
      ),
    );
  }
}
