class EmployeeInDealVO {
  String? sId;
  String? givenName;
  String? email;

  EmployeeInDealVO({this.sId, this.givenName, this.email});

  EmployeeInDealVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    givenName = json['givenName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['givenName'] = this.givenName;
    data['email'] = this.email;
    return data;
  }
}
