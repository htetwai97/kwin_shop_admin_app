import 'package:kwin_shops_admin_app/data/vos/discount_in_deal_vo.dart';

class SubscriptionTypeInDealVO {
  String? sId;
  String? name;
  String? code;
  int? price;
  String? description;
  DiscountInDealVO? duration;

  SubscriptionTypeInDealVO(
      {this.sId,
      this.name,
      this.code,
      this.price,
      this.description,
      this.duration});

  SubscriptionTypeInDealVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    code = json['code'];
    price = json['price'];
    description = json['description'];
    duration = json['duration'] != null
        ? new DiscountInDealVO.fromJson(json['duration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['price'] = this.price;
    data['description'] = this.description;
    if (this.duration != null) {
      data['duration'] = this.duration!.toJson();
    }
    return data;
  }
}
