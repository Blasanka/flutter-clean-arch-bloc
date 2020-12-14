import 'package:customers_manager/src/CustomersManagerApp.dart';
import 'package:customers_manager/src/InjectorProvider.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();
  runApp(CustomersManagerApp());
}