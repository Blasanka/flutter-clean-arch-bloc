import 'dart:developer' show log;

import 'package:customers_manager/src/InjectorProvider.dart';
import 'package:customers_manager/src/data/sources/local/daos/CustomerDAO.dart';
import 'package:customers_manager/src/domain/models/Customer.dart';
class CustomerService {
  CustomerDAO _customerDao = inject<CustomerDAO>();

  Future<List<Customer>> fetchAllCustomers() async {
    await _customerDao.getDbInstance();
    try {
      return await _customerDao.readCustomers();
    } catch (e, t) {
      log(t.toString());
      log(e.toString());
      return null;
    }
  }

  Future<Customer> fetchSingleCustomer(int id) async {
    await _customerDao.getDbInstance();
    try {
      return await _customerDao.readCustomer(id);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<bool> saveCustomer(Customer customer) async {
    await _customerDao.getDbInstance();
    try {
      return await _customerDao.insert(customer);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<bool> updateCustomer(int id, Customer customer) async {
    await _customerDao.getDbInstance();
    try {
      return await _customerDao.update(id, customer);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<bool> deleteCustomer(int id) async {
    await _customerDao.getDbInstance();
    try {
      return await _customerDao.delete(id);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}