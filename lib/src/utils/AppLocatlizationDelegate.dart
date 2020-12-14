import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Customers Manager',
      'homeTitle': "Customers",
      'addNewTitle': "Add new",
      'updateTitle': "Update",
      'detailTitle': "Details",
      'fName': "First Name",
      'lName': "Last Name",
      'dob': "Birthday",
      'city': "City",
      'state': "State",
      'zipcode': "Zipcode",
      'email': "Email",
      'phone': "Phone",
      'mobile': "Mobile",
      'noData': "No customers yet",
      'submit': "SUBMIT",
      'update': "UPDATE",
      'success': "Succeeded!",
      'failure': "Error occurred",
      'updated': "Updated!",
      'deleted': "Deleted!",
    },
    'es': {
      'title': 'Gerente de Clientes',
    },
  };

  String get title => _localizedValues[locale.languageCode]['title'];
  String get homeTitle => _localizedValues[locale.languageCode]['homeTitle'];
  String get addNewTitle => _localizedValues[locale.languageCode]['addNewTitle'];
  String get updateTitle => _localizedValues[locale.languageCode]['updateTitle'];
  String get detailTitle => _localizedValues[locale.languageCode]['detailTitle'];
  String get noData => _localizedValues[locale.languageCode]['noData'];
  String get fName => _localizedValues[locale.languageCode]['fName'];
  String get lName => _localizedValues[locale.languageCode]['lName'];
  String get birthday => _localizedValues[locale.languageCode]['dob'];
  String get city => _localizedValues[locale.languageCode]['city'];
  String get state => _localizedValues[locale.languageCode]['state'];
  String get zipcode => _localizedValues[locale.languageCode]['zipcode'];
  String get email => _localizedValues[locale.languageCode]['email'];
  String get phone => _localizedValues[locale.languageCode]['phone'];
  String get mobile => _localizedValues[locale.languageCode]['mobile'];
  String get submit => _localizedValues[locale.languageCode]['submit'];
  String get update => _localizedValues[locale.languageCode]['update'];
  String get success => _localizedValues[locale.languageCode]['success'];
  String get failure => _localizedValues[locale.languageCode]['failure'];
  String get updated => _localizedValues[locale.languageCode]['updated'];
  String get deleted => _localizedValues[locale.languageCode]['deleted'];
}