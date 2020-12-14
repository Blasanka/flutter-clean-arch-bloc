
import 'package:customers_manager/src/utils/RouteNames.dart';
import 'package:flutter/material.dart';

class AddNewFAButton extends StatelessWidget {
  const AddNewFAButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, RouteNames.addNew);
      },
      child: Icon(Icons.add),
    );
  }
}
