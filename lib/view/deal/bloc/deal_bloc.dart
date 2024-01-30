import 'package:flutter/foundation.dart';
import 'package:kwin_shops_admin_app/core/core_functions/functions.dart';
import 'package:kwin_shops_admin_app/data/model/repo_model.dart';
import 'package:kwin_shops_admin_app/data/model/repo_model_impl.dart';
import 'package:kwin_shops_admin_app/data/vos/deal_for_list_vo.dart';

class DealBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final RepoModel _repoModel = RepoModelImpl();

  /// Loading State
  bool isLoading = false;
  bool isSwitching = false;

  /// Screen states
  List<DealForListVO>? dealList;
  String customerId = "";

  DealBloc(String customerId) {
    _showLoading();
    this.customerId = customerId;
    _repoModel.getCustomerDeals(customerId).then((response) {
      dealList = response.data;
      _notifySafely();
      _hideLoading();
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Functions.toast(msg: "Failed Loading", status: false);
      _hideLoading();
    });
  }

  Future<void> onSwitch(bool isAlreadyOn, String dealId, String appName) {
    isSwitching = true;
    _notifySafely();
    return _repoModel
        .postSwitch(dealId, isAlreadyOn ? "suspend" : "activate")
        .then((value) {
      _repoModel.getCustomerDeals(customerId).then((response) {
        dealList = response.data;
        Functions.toast(
            msg: (isAlreadyOn)
                ? "$appName is successfully suspended"
                : "$appName is successfully activated",
            status: false);
        isSwitching = false;
        _notifySafely();
      }).onError((error, stackTrace) {
        debugPrint(error.toString());
        Functions.toast(msg: "Failed Loading", status: false);
        isSwitching = false;
        _notifySafely();
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Functions.toast(msg: "Failed Switching", status: false);
      isSwitching = false;
      _notifySafely();
    });
  }

  /// loading situations
  void _showLoading() {
    isLoading = true;
    _notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    _notifySafely();
  }

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
