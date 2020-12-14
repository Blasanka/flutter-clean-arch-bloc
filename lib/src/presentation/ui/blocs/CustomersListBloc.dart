import 'package:customers_manager/src/InjectorProvider.dart';
import 'package:customers_manager/src/data/CustomerRepository.dart';
import 'package:customers_manager/src/domain/models/Customer.dart';
import 'package:rxdart/rxdart.dart';

class CustomersListBloc {
  CustomerRepository _repository = inject<CustomerRepository>();

  bool _loading = false;
  final _customers = BehaviorSubject<List<Customer>>();
  String _feedback = "";

  bool get loading => _loading;
  void _setLoading(bool value) => _loading = value;

  String get feedback => _feedback;
  void setFeedback(String value) => _feedback = value;

  Stream<List<Customer>> get customers => _customers.stream;
  void setCustomer(List<Customer> customer) => _customers.sink.add(customer);

  Stream<List<Customer>> getAllCustomers() async* {
    _setLoading(true);
    _feedback = "Please wait...";

    final ret = await _repository.getAllCustomers();
    _setLoading(false);
    if (ret != null) {
      if (ret.isNotEmpty) {
        _feedback = null;
        setCustomer(ret);
      } else {
        _feedback = "No customers yet";
        setCustomer([]);
      }
    } else {
      _feedback = "Something went wrong, please try again!";
      setCustomer([]);
    }
    yield _customers.value;
  }

  void dispose() {
    _customers.close();
  }
}