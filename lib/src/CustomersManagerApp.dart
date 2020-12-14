import 'package:customers_manager/src/presentation/res/AppTheme.dart';
import 'package:customers_manager/src/presentation/ui/screens/screens.dart';
import 'package:customers_manager/src/utils/AppLocatlizationDelegate.dart';
import 'package:customers_manager/src/utils/RouteNames.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CustomersManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context).title,
      routes: {
        RouteNames.home: (_) => CustomersListScreen(),
        RouteNames.addNew: (_) => AddNewCustomerScreen(),
        RouteNames.update: (_) => UpdateCustomerScreen(),
        RouteNames.detail: (_) => CustomerDetailScreen(),
      },
      initialRoute: RouteNames.home,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}