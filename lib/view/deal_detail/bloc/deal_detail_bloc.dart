import 'package:flutter/foundation.dart';
import 'package:kwin_shops_admin_app/data/model/repo_model.dart';
import 'package:kwin_shops_admin_app/data/model/repo_model_impl.dart';
import 'package:kwin_shops_admin_app/data/vos/deal_vo.dart';

class DealDetailBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final RepoModel _repoModel = RepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  DealVO? dealVO;
  DealDetailBloc(String dealId) {
    _showLoading();
    _repoModel.getSingleDealById(dealId).then((response) {
      dealVO = response;
      _notifySafely();
      _hideLoading();
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
