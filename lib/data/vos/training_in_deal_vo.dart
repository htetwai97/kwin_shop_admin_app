class TrainingInDealVO {
  int? day;
  int? hour;
  int? person;

  TrainingInDealVO({this.day, this.hour, this.person});

  TrainingInDealVO.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    hour = json['hour'];
    person = json['person'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['hour'] = this.hour;
    data['person'] = this.person;
    return data;
  }
}
