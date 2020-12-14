import 'package:customers_manager/src/InjectorProvider.dart';
import 'package:customers_manager/src/data/CustomerRepository.dart';
import 'package:customers_manager/src/domain/models/Customer.dart';
import 'package:customers_manager/src/presentation/ui/widgets/CustomToast.dart';
import 'package:customers_manager/src/utils/AppLocatlizationDelegate.dart';
import 'package:customers_manager/src/utils/RouteNames.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class CustomerManageBloc {
  CustomerRepository _repository = inject<CustomerRepository>();

  final _loading = BehaviorSubject<bool>();
  final _selectedCustomer = BehaviorSubject<Customer>();

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  Customer get selectedCustomer => _selectedCustomer.value;
  void setSelectedCustomer(Customer value) => _selectedCustomer.sink.add(value);

  Future update(context) async {
    _setLoading(true);
    final ret = await _repository.updateCustomer(selectedCustomer.id, selectedCustomer);
    _setLoading(false);

    if (ret != null && ret) {
      CustomToast.show(AppLocalizations.of(context).updated);
      Navigator.pushNamedAndRemoveUntil(context, RouteNames.home, (route) => false);
    } else {
      CustomToast.show(AppLocalizations.of(context).failure);
    }

  }

  void delete(context, int id) async {
    _setLoading(true);
    final ret = await _repository.deleteCustomer(id);
    _setLoading(false);

    if (ret != null && ret) {
      CustomToast.show(AppLocalizations.of(context).deleted);
      Navigator.pushNamedAndRemoveUntil(context, RouteNames.home, (route) => false);
    } else {
      CustomToast.show(AppLocalizations.of(context).failure);
    }

  }

  void dispose() {
    _loading.close();
    _selectedCustomer.close();
  }
}