import 'package:flutter/material.dart';
import 'package:superhero_app/podo/cage_master.dart';



class CageMasterListWidget extends StatelessWidget {
  final List cageList;

  CageMasterListWidget(this.cageList);

  deleteCage(int id) {
    print('hapus '+id.toString());
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body : Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
              );
            },
            shrinkWrap: true,
            itemCount: cageList == null ? 0 : cageList.length,
            itemBuilder: (BuildContext context, int index) {
            CageMaster cage = CageMaster.fromJson(cageList[index]);
    
              return Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(cage.cageName, style: textTheme.title),
                          Text(cage.notes, style: textTheme.body1)
                          ]
                      ),
                  IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        deleteCage(cage.cageId);
                      })
                  ]
              );
            },
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

        },
      ),
    );
  }

}