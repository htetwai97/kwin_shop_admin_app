class ExtraDataInDealVO {
  int? amount;
  int? charge;

  ExtraDataInDealVO({this.amount, this.charge});

  ExtraDataInDealVO.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    charge = json['charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['charge'] = this.charge;
    return data;
  }
}
