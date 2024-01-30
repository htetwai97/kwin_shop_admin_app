import 'package:kwin_shops_admin_app/data/vos/deal_for_list_vo.dart';

class GetCustomerDealsResponse {
  int? count;
  List<DealForListVO>? data;

  GetCustomerDealsResponse({this.count, this.data});

  GetCustomerDealsResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <DealForListVO>[];
      json['data'].forEach((v) {
        data!.add(new DealForListVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
