import 'package:kwin_shops_admin_app/data/model/repo_model.dart';
import 'package:kwin_shops_admin_app/data/vos/deal_vo.dart';
import 'package:kwin_shops_admin_app/network/data_agent/dio_data_agent_impl.dart';
import 'package:kwin_shops_admin_app/network/response/get_customer_deals_response.dart';
import 'package:kwin_shops_admin_app/network/response/get_customers_response.dart';

class RepoModelImpl extends RepoModel {
  RepoModelImpl._internal();
  static final RepoModelImpl _singleton = RepoModelImpl._internal();
  factory RepoModelImpl() => _singleton;
  final _dioDataAgent = DioDataAgentImpl();

  @override
  Future<GetCustomersResponse> getCustomers() {
    return _dioDataAgent.getCustomers();
  }

  @override
  Future<GetCustomerDealsResponse> getCustomerDeals(String customerId) {
    return _dioDataAgent.getCustomerDeals(customerId);
  }

  @override
  Future<DealVO> getSingleDealById(String dealId) {
    return _dioDataAgent.getSingleDealById(dealId);
  }

  @override
  Future<void> postSwitch(String dealId, String switchMethod) {
    return _dioDataAgent.postSwitch(dealId, switchMethod);
  }
}
