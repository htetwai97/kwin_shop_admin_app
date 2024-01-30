import 'package:kwin_shops_admin_app/data/vos/deal_vo.dart';
import 'package:kwin_shops_admin_app/network/response/get_customer_deals_response.dart';
import 'package:kwin_shops_admin_app/network/response/get_customers_response.dart';

abstract class DioDataAgent {
  Future<GetCustomersResponse> getCustomers();
  Future<GetCustomerDealsResponse> getCustomerDeals(String customerId);
  Future<DealVO> getSingleDealById(String dealId);
  Future<void> postSwitch(String dealId,String switchMethod);
}