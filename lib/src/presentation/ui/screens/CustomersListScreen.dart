import 'package:customers_manager/src/InjectorProvider.dart';
import 'package:customers_manager/src/domain/models/Customer.dart';
import 'package:customers_manager/src/presentation/ui/blocs/CustomersListBloc.dart';
import 'package:customers_manager/src/presentation/ui/widgets/AddNewFAButton.dart';
import 'package:customers_manager/src/presentation/ui/widgets/CustomAppBar.dart';
import 'package:customers_manager/src/presentation/ui/widgets/CustomerListView.dart';
import 'package:customers_manager/src/utils/AppLocatlizationDelegate.dart';
import 'package:flutter/material.dart';

// 3 hours
class CustomersListScreen extends StatefulWidget {
  @override
  _CustomersListScreenState createState() => _CustomersListScreenState();
}

class _CustomersListScreenState extends State<CustomersListScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final bloc = inject<CustomersListBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //TODO;
    // bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(title: AppLocalizations.of(context).homeTitle),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (bloc.loading) LinearProgressIndicator(),
          StreamBuilder<List<Customer>>(
              stream: bloc.getAllCustomers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                if (snapshot.hasData) {
                  if (bloc.feedback != null) return Center(child: Text(bloc.feedback));
                  return Expanded(
                      child: CustomerListView(customers: snapshot.data));
                }
                return Center(child: Text(AppLocalizations.of(context).noData));
              }),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: AddNewFAButton(),
    );
  }
}