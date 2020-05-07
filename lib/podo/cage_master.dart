class CageMaster {
  int cageId;
  String cageName;
  String notes;

  CageMaster.fromJson(Map<String, dynamic> json){
    cageId = json['cageId'];
    cageName = json['cageName'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cageId'] = this.cageId;
    data['cageName'] = this.cageName;
    data['notes'] = this.notes;
    return data;
  }
}