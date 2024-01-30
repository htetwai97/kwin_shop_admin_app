import 'package:kwin_shops_admin_app/data/vos/customer_in_deal_vo.dart';
import 'package:kwin_shops_admin_app/data/vos/discount_in_deal_vo.dart';
import 'package:kwin_shops_admin_app/data/vos/employee_in_deal_vo.dart';
import 'package:kwin_shops_admin_app/data/vos/extra_data_in_deal_vo.dart';
import 'package:kwin_shops_admin_app/data/vos/extra_training_in_deal_vo.dart';
import 'package:kwin_shops_admin_app/data/vos/subscription_type_in_deal_vo.dart';
import 'package:kwin_shops_admin_app/data/vos/training_in_deal_vo.dart';

class DealVO {
  String? sId;
  String? code;
  String? appName;
  CustomerInDealVO? customer;
  EmployeeInDealVO? employee;
  int? requestPrice;
  String? requestTime;
  String? requestDetail;
  TrainingInDealVO? training;
  bool? provideExtraTraining;
  ExtraTrainingInDealVO? extraTraining;
  bool? fillData;
  bool? fillExtraData;
  ExtraDataInDealVO? extraData;
  int? dataAmount;
  int? dealPrice;
  String? numOfUser;
  int? numOfBranch;
  int? freeSubscription;
  String? date;
  String? projectStartDate;
  DiscountInDealVO? discount;
  String? paymentTerm;
  SubscriptionTypeInDealVO? subscriptionType;
  int? netDealPrice;
  String? level;
  bool? accessible;

  DealVO(
      {this.sId,
      this.code,
      this.appName,
      this.customer,
      this.employee,
      this.requestPrice,
      this.requestTime,
      this.requestDetail,
      this.training,
      this.dealPrice,
      this.numOfUser,
      this.numOfBranch,
      this.freeSubscription,
      this.date,
      this.projectStartDate,
      this.discount,
      this.paymentTerm,
      this.subscriptionType,
      this.netDealPrice,
      this.level,
      this.accessible});

  DealVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    code = json['code'];
    appName = json['appName'];
    customer = json['customer'] != null
        ? new CustomerInDealVO.fromJson(json['customer'])
        : null;
    employee = json['employee'] != null
        ? new EmployeeInDealVO.fromJson(json['employee'])
        : null;
    requestPrice = json['requestPrice'];
    requestTime = json['requestTime'];
    requestDetail = json['requestDetail'];
    training = json['training'] != null
        ? new TrainingInDealVO.fromJson(json['training'])
        : null;
    dealPrice = json['dealPrice'];
    numOfUser = json['numOfUser'];
    numOfBranch = json['numOfBranch'];
    freeSubscription = json['freeSubscription'];
    date = json['date'];
    projectStartDate = json['projectStartDate'];
    discount = json['discount'] != null
        ? new DiscountInDealVO.fromJson(json['discount'])
        : null;
    paymentTerm = json['paymentTerm'];
    subscriptionType = json['subscriptionType'] != null
        ? new SubscriptionTypeInDealVO.fromJson(json['subscriptionType'])
        : null;
    netDealPrice = json['netDealPrice'];
    level = json['level'];
    accessible = json['accessible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['code'] = this.code;
    data['appName'] = this.appName;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    data['requestPrice'] = this.requestPrice;
    data['requestTime'] = this.requestTime;
    data['requestDetail'] = this.requestDetail;
    if (this.training != null) {
      data['training'] = this.training!.toJson();
    }
    data['dealPrice'] = this.dealPrice;
    data['numOfUser'] = this.numOfUser;
    data['numOfBranch'] = this.numOfBranch;
    data['freeSubscription'] = this.freeSubscription;
    data['date'] = this.date;
    data['projectStartDate'] = this.projectStartDate;
    if (this.discount != null) {
      data['discount'] = this.discount!.toJson();
    }
    data['paymentTerm'] = this.paymentTerm;
    if (this.subscriptionType != null) {
      data['subscriptionType'] = this.subscriptionType!.toJson();
    }
    data['netDealPrice'] = this.netDealPrice;
    data['level'] = this.level;
    data['accessible'] = this.accessible;
    return data;
  }
}
