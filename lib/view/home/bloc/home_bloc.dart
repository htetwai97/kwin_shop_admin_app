import 'package:flutter/foundation.dart';
import 'package:kwin_shops_admin_app/data/model/repo_model.dart';
import 'package:kwin_shops_admin_app/data/model/repo_model_impl.dart';
import 'package:kwin_shops_admin_app/data/vos/customer_vo.dart';

class HomeBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final RepoModel _repoModel = RepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<CustomerVO>? customerList;

  HomeBloc() {
    _showLoading();
    _repoModel.getCustomers().then((response) {
      customerList = response.data;
      _notifySafely();
      _hideLoading();
    }).onError((error, stackTrace) {
      debugPrint(
          "Error===>${error.toString()}\nStackTrace===>${stackTrace.toString()}");
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
