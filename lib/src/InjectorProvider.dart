import 'package:customers_manager/src/data/CustomerRepository.dart';
import 'package:customers_manager/src/data/CustomerService.dart';
import 'package:customers_manager/src/data/sources/local/daos/CustomerDAO.dart';
import 'package:customers_manager/src/presentation/ui/blocs/CustomerManageBloc.dart';
import 'package:customers_manager/src/presentation/ui/blocs/CustomersListBloc.dart';
import 'package:customers_manager/src/presentation/ui/blocs/AddCustomerBloc.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {

  // DAOs
  inject.registerFactory(() => CustomerDAO());

  //Remote Services
  inject.registerFactory(() => CustomerService());

  //Repositories
  inject.registerFactory(() => CustomerRepository());

  //Blocs
  inject.registerLazySingleton(() => CustomersListBloc());
  inject.registerLazySingleton(() => AddCustomerBloc());
  inject.registerLazySingleton(() => CustomerManageBloc());
}