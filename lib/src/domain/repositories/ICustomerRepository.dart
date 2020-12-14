import 'package:customers_manager/src/domain/models/Customer.dart';

abstract class ICustomerRepository {
  Future<List<Customer>> getAllCustomers();
  Future<Customer> getCustomer(int id);
  Future<bool> updateCustomer(int id, Customer customer);
  Future<bool> saveCustomer(Customer customer);
  Future<bool> deleteCustomer(int id);
}