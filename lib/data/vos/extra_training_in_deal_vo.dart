import 'package:kwin_shops_admin_app/data/vos/training_in_deal_vo.dart';

class ExtraTrainingInDealVO {
  TrainingInDealVO? amount;
  int? charge;

  ExtraTrainingInDealVO({this.amount, this.charge});

  ExtraTrainingInDealVO.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] != null
        ? new TrainingInDealVO.fromJson(json['amount'])
        : null;
    charge = json['charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.amount != null) {
      data['amount'] = this.amount!.toJson();
    }
    data['charge'] = this.charge;
    return data;
  }
}
