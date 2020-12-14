import 'package:customers_manager/src/InjectorProvider.dart';
import 'package:customers_manager/src/presentation/res/AppDimens.dart' as dimens;
import 'package:customers_manager/src/presentation/ui/blocs/CustomerManageBloc.dart';
import 'package:customers_manager/src/presentation/ui/widgets/CustomAppBar.dart';
import 'package:customers_manager/src/utils/AppLocatlizationDelegate.dart';
import 'package:flutter/material.dart';

class CustomerDetailScreen extends StatefulWidget {
  @override
  _CustomerDetailScreenState createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final bloc = inject<CustomerManageBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(title: AppLocalizations.of(context).detailTitle),
      body: Padding(
        padding: const EdgeInsets.all(dimens.AppDimens.defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(bloc.selectedCustomer.toString())),
          ],
        ),
      ),
    );
  }
}