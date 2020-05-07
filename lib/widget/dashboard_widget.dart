import 'package:flutter/material.dart';
import 'package:superhero_app/podo/cage.dart';
import 'package:superhero_app/widget/cage_widget.dart';

class DashboardWidget extends StatelessWidget {
  final List responseList;

  DashboardWidget(this.responseList);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: responseList == null ? 0 : responseList.length,
        itemBuilder: (BuildContext context, int index) {
          Cage cage = Cage.fromJson(responseList[index]);

          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: CageWidget(
              cageName: cage.cageName,
              populationPlus: cage.populationPlus,
              populationMinus: cage.populationMinus,
              populationTotal: cage.populationTotal,
              feed: cage.feed,
              eggProduction: cage.eggProduction,
            ),
          );
        },
      ),
    );
  }

}