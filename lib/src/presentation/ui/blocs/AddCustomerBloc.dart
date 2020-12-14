import 'package:customers_manager/src/InjectorProvider.dart';
import 'package:customers_manager/src/data/CustomerRepository.dart';
import 'package:customers_manager/src/domain/models/Customer.dart';
import 'package:customers_manager/src/presentation/ui/widgets/CustomToast.dart';
import 'package:customers_manager/src/utils/AppLocatlizationDelegate.dart';
import 'package:customers_manager/src/utils/RouteNames.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class AddCustomerBloc {
  CustomerRepository _repository = inject<CustomerRepository>();

  final _loading = BehaviorSubject<bool>();
  final _newCustomer = BehaviorSubject<Customer>();

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  Stream<Customer> get newCustomer => _newCustomer.stream;
  void setNewCustomer(Customer value) => _newCustomer.sink.add(value);

  Future submit(context) async {
    _setLoading(true);
    final ret = await _repository.saveCustomer(_newCustomer.value);
    _setLoading(false);

    if (ret != null && ret) {
      CustomToast.show(AppLocalizations.of(context).success);
      Navigator.pushNamedAndRemoveUntil(context, RouteNames.home, (route) => false);
    } else {
      CustomToast.show(AppLocalizations.of(context).failure);
    }

  }

  void dispose() {
    _loading.close();
    _newCustomer.close();
  }
}