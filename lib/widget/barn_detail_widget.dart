import 'package:flutter/material.dart';
import 'package:superhero_app/widget/cage_summary_widget.dart';

class BarnDetailWidget extends StatelessWidget {
  var cageId;
  var cageName;
  var populationPlus;
  var populationMinus;
  var populationTotal;
  var feed;
  var eggProduction;

  BarnDetailWidget({
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
    
    return TabBarView(
      children: <Widget>[
        CageSummaryWidget(cageId: cageId, cageName: cageName, populationPlus: populationPlus, populationMinus: populationMinus, populationTotal: populationTotal, feed: feed, eggProduction: eggProduction),
        Text('2'),
        Text('3'),
        Text('4')
      ],
    );
  }
}