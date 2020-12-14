import 'package:customers_manager/src/InjectorProvider.dart';
import 'package:customers_manager/src/data/CustomerService.dart';
import 'package:customers_manager/src/domain/models/Customer.dart';
import 'package:customers_manager/src/domain/repositories/ICustomerRepository.dart';

class CustomerRepository implements ICustomerRepository {
  CustomerService service = inject<CustomerService>();

  @override
  Future<List<Customer>> getAllCustomers() {
    return service.fetchAllCustomers();
  }

  @override
  Future<Customer> getCustomer(int id) {
    return service.fetchSingleCustomer(id);
  }

  @override
  Future<bool> saveCustomer(customer) {
    return service.saveCustomer(customer);
  }

  @override
  Future<bool> updateCustomer(int id, customer) {
    return service.updateCustomer(id, customer);
  }

  @override
  Future<bool> deleteCustomer(int id) {
    return service.deleteCustomer(id);
  }

}