import 'package:customers_manager/src/InjectorProvider.dart';
import 'package:customers_manager/src/domain/models/Customer.dart';
import 'package:customers_manager/src/presentation/res/AppColors.dart' as colors;
import 'package:customers_manager/src/presentation/ui/blocs/CustomerManageBloc.dart';
import 'package:customers_manager/src/presentation/ui/widgets/CustomToast.dart';
import 'package:customers_manager/src/utils/AppLocatlizationDelegate.dart';
import 'package:customers_manager/src/utils/RouteNames.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableWidget extends StatelessWidget {
  final Widget child;
  final Customer customer;

  SlidableWidget({@required this.child, @required this.customer})
    : assert(child != null && customer != null);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      child: child,
      secondaryActions: <Widget>[
        IconSlideAction(
          color: colors.AppColors.green,
          icon: Icons.edit,
          foregroundColor: colors.AppColors.white,
          onTap: () {
            var bloc = inject<CustomerManageBloc>();
            bloc.setSelectedCustomer(customer);
            Navigator.pushNamed(context, RouteNames.update);
          },
        ),
        IconSlideAction(
          color: colors.AppColors.red,
          icon: Icons.delete,
          onTap: () {
            var bloc = inject<CustomerManageBloc>();
            bloc.delete(context, customer.id);
            CustomToast.show(AppLocalizations.of(context).deleted);
          },
        ),
      ],
    );
  }
}
