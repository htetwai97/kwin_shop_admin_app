import 'package:dio/dio.dart';
import 'package:kwin_shops_admin_app/data/vos/deal_vo.dart';
import 'package:kwin_shops_admin_app/network/api_service/api_constants.dart';
import 'package:kwin_shops_admin_app/network/api_service/api_service.dart';
import 'package:kwin_shops_admin_app/network/data_agent/dio_data_agent.dart';
import 'package:kwin_shops_admin_app/network/response/get_customer_deals_response.dart';
import 'package:kwin_shops_admin_app/network/response/get_customers_response.dart';

class DioDataAgentImpl extends DioDataAgent {
  DioDataAgentImpl._internal();
  static final DioDataAgentImpl _singleton = DioDataAgentImpl._internal();
  factory DioDataAgentImpl() => _singleton;

  @override
  Future<GetCustomersResponse> getCustomers() async {
    var dio = DioUtil.getDio(null);
    try {
      final response = await dio.get("$BASE_URL/$END_POINT_GET_CUSTOMERS");
      if (response.statusCode == 200) {
        return GetCustomersResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetCustomerDealsResponse> getCustomerDeals(String customerId) async {
    var dio = DioUtil.getDio(null);
    dio.options.queryParameters = {
      "customer": customerId,
    };
    try {
      final response = await dio.get("$BASE_URL/$END_POINT_GET_CUSTOMER_DEAL");
      if (response.statusCode == 200) {
        return GetCustomerDealsResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<DealVO> getSingleDealById(String dealId) async {
    var dio = DioUtil.getDio(null);
    try {
      final response =
          await dio.get("$BASE_URL/$END_POINT_GET_CUSTOMER_DEAL/$dealId");
      if (response.statusCode == 200) {
        return DealVO.fromJson(response.data['data']);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> postSwitch(String dealId,String switchMethod) async {
    var dio = DioUtil.getDio(null);
    try {
      final response =
      await dio.post("$BASE_URL/$END_POINT_GET_CUSTOMER_DEAL/$dealId/$switchMethod");
      if (response.statusCode == 200) {
        return Future.value();
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
