import 'package:customers_manager/src/InjectorProvider.dart';
import 'package:customers_manager/src/domain/models/Customer.dart';
import 'package:customers_manager/src/presentation/ui/blocs/CustomerManageBloc.dart';
import 'package:customers_manager/src/presentation/ui/widgets/SlidableWidget.dart';
import 'package:customers_manager/src/utils/RouteNames.dart';
import 'package:flutter/material.dart';
import 'package:customers_manager/src/presentation/res/AppDimens.dart' as dimens;

class DataCard extends StatelessWidget {
  final Customer _customer;

  DataCard({Customer customer})
      : _customer = customer;

  @override
  Widget build(BuildContext context) {
    return SlidableWidget(
      child: buildCard(context),
      customer: _customer,
    );
  }

  Card buildCard(BuildContext context) {
    return Card(
      elevation: .2,
      margin: EdgeInsets.symmetric(vertical: dimens.AppDimens.gap),
      child: InkWell(
        onTap: () {
          inject<CustomerManageBloc>().setSelectedCustomer(_customer);
          Navigator.pushNamed(context, RouteNames.detail);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(dimens.AppDimens.defaultMargin),
              child: Row(
                children: [
                  CircleAvatar(),
                  SizedBox(width: dimens.AppDimens.defaultMargin),
                  buildHeading(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildHeading(BuildContext context) {
    return Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildNameRow(context),
                    Text(
                      _customer?.contacts?.email ?? "",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              );
  }

  Row buildNameRow(BuildContext context) {
    return Row(
                      children: [
                        Text(
                          _customer?.firstName ?? "",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                          _customer?.lastName ?? "",
                          style: Theme.of(context).textTheme.subtitle1,
                        )),
                      ],
                    );
  }
}
