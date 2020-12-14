

import 'package:customers_manager/src/presentation/res/AppDimens.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, AppDimens.appBarHeight);
}
