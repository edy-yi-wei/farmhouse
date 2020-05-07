class Cage {
  int cageId;
  String cageName;
  int populationPlus;
  int populationMinus;
  int populationTotal;
  int feed;
  int eggProduction;

  Cage({this.cageId, this.cageName, this.populationPlus, this.populationMinus, this.populationTotal, this.feed, this.eggProduction});

  Cage.fromJson(Map<String, dynamic> json){
    cageId = json['cageId'];
    cageName = json['cageName'];
    populationPlus = json['populationPlus'];
    populationMinus = json['populationMinus'];
    populationTotal = json['populationTotal'];
    feed = json['feed'];
    eggProduction = json['eggProduction'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cageId'] = this.cageId;
    data['cageName'] = this.cageName;
    data['populationPlus'] = this.populationPlus;
    data['populationMinus'] = this.populationMinus;
    data['populationTotal'] = this.populationTotal;
    data['feed'] = this.feed;
    data['eggProduction'] = this.eggProduction;
    return data;
  }
}