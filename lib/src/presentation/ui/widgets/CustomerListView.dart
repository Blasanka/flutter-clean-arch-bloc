import 'package:customers_manager/src/domain/models/Customer.dart';
import 'package:customers_manager/src/presentation/ui/widgets/DataCard.dart';
import 'package:flutter/material.dart';

class CustomerListView extends StatelessWidget {
  final List<Customer> _customers;

  CustomerListView({List<Customer> customers}) : _customers = customers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _customers.length,
      itemBuilder: (BuildContext context, int index) =>
          DataCard(customer: _customers[index]),
    );
  }
}
