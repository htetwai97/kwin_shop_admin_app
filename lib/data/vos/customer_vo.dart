import 'package:kwin_shops_admin_app/data/vos/logo_vo.dart';

class CustomerVO {
  String? sId;
  String? name;
  String? code;
  String? email;
  String? phone;
  String? businessType;
  String? businessName;
  String? status;
  List<String>? customerAccounts;
  int? appointmentCount;
  String? address;
  LogoVO? logo;

  CustomerVO({
    this.sId,
    this.name,
    this.code,
    this.email,
    this.phone,
    this.businessType,
    this.businessName,
    this.status,
    this.customerAccounts,
    this.appointmentCount,
    this.address,
    this.logo,
  });

  CustomerVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    code = json['code'];
    email = json['email'];
    phone = json['phone'];
    businessType = json['businessType'];
    businessName = json['businessName'];
    status = json['status'];
    customerAccounts = json['customerAccounts'].cast<String>();
    appointmentCount = json['appointmentCount'];
    address = json['address'];
    logo = json['logo'] != null ? new LogoVO.fromJson(json['logo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['businessType'] = this.businessType;
    data['businessName'] = this.businessName;
    data['status'] = this.status;
    data['customerAccounts'] = this.customerAccounts;
    data['appointmentCount'] = this.appointmentCount;
    data['address'] = this.address;
    if (this.logo != null) {
      data['logo'] = this.logo!.toJson();
    }
    return data;
  }
}
