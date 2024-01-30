import 'package:kwin_shops_admin_app/data/vos/customer_vo.dart';

class GetCustomersResponse {
  List<CustomerVO>? data;

  GetCustomersResponse({this.data});

  GetCustomersResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CustomerVO>[];
      json['data'].forEach((v) {
        data!.add(new CustomerVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
