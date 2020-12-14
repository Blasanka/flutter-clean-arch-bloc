import 'package:customers_manager/src/InjectorProvider.dart';
import 'package:customers_manager/src/domain/models/Customer.dart';
import 'package:customers_manager/src/presentation/ui/blocs/AddCustomerBloc.dart';
import 'package:customers_manager/src/presentation/ui/widgets/CustomAppBar.dart';
import 'package:customers_manager/src/presentation/ui/widgets/CustomButton.dart';
import 'package:customers_manager/src/presentation/ui/widgets/CustomTextField.dart';
import 'package:customers_manager/src/utils/AppLocatlizationDelegate.dart';
import 'package:customers_manager/src/presentation/res/AppDimens.dart' as dimens;
import 'package:flutter/material.dart';

// 1 hours
class AddNewCustomerScreen extends StatefulWidget {
  @override
  _AddNewCustomerScreenState createState() => _AddNewCustomerScreenState();
}

class _AddNewCustomerScreenState extends State<AddNewCustomerScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _fNameController;
  TextEditingController _lNameController;
  TextEditingController _dobController;
  TextEditingController _cityController;
  TextEditingController _stateController;
  TextEditingController _zipcodeController;
  TextEditingController _emailController;
  TextEditingController _phoneController;
  TextEditingController _mobileController;

  final bloc = inject<AddCustomerBloc>();

  @override
  void initState() {
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _dobController = TextEditingController();
    _cityController = TextEditingController();
    _stateController = TextEditingController();
    _zipcodeController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _mobileController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _dobController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipcodeController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _mobileController.dispose();
    //TODO:
    // bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(title: AppLocalizations.of(context).addNewTitle),
      body: Padding(
        padding: EdgeInsets.all(dimens.AppDimens.defaultMargin),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomTextField(
                  labelText: AppLocalizations.of(context).fName,
                  controller: _fNameController,
                  validator: isEmpty,
                ),
                SizedBox(height: dimens.AppDimens.defaultMargin),
                CustomTextField(
                  labelText: AppLocalizations.of(context).lName,
                  controller: _lNameController,
                  validator: isEmpty,
                ),
                SizedBox(height: dimens.AppDimens.defaultMargin),
                CustomTextField(
                  labelText: AppLocalizations.of(context).birthday,
                  controller: _dobController,
                  validator: isEmpty,
                ),
                SizedBox(height: dimens.AppDimens.defaultMargin),
                CustomTextField(
                  labelText: AppLocalizations.of(context).city,
                  controller: _cityController,
                  validator: isEmpty,
                ),
                SizedBox(height: dimens.AppDimens.defaultMargin),
                CustomTextField(
                  labelText: AppLocalizations.of(context).state,
                  controller: _stateController,
                  validator: isEmpty,
                ),
                SizedBox(height: dimens.AppDimens.defaultMargin),
                CustomTextField(
                  labelText: AppLocalizations.of(context).zipcode,
                  controller: _zipcodeController,
                  validator: isEmpty,
                ),
                SizedBox(height: dimens.AppDimens.defaultMargin),
                CustomTextField(
                  labelText: AppLocalizations.of(context).email,
                  controller: _emailController,
                  validator: isEmpty,
                ),
                SizedBox(height: dimens.AppDimens.defaultMargin),
                CustomTextField(
                  labelText: AppLocalizations.of(context).phone,
                  controller: _phoneController,
                  validator: isEmpty,
                ),
                SizedBox(height: dimens.AppDimens.defaultMargin),
                CustomTextField(
                  labelText: AppLocalizations.of(context).mobile,
                  controller: _mobileController,
                  validator: isEmpty,
                ),
                SizedBox(height: dimens.AppDimens.defaultMargin),
                StreamBuilder<bool>(
                  initialData: false,
                  stream: bloc.loading,
                  builder: (context, snapshot) {
                    return CustomButton(
                      label: AppLocalizations.of(context).submit,
                      isBusy: snapshot.data,
                      action: () async {
                        if (_formKey.currentState.validate()) {
                          bloc.setNewCustomer(Customer(
                            firstName: _fNameController.text,
                            lastName: _lNameController.text,
                            birthday: _dobController.text,
                            address: Address(
                              city: _cityController.text,
                              state: _stateController.text,
                              zipcode: _zipcodeController.text,
                            ),
                            contacts: Contact(
                              email: _emailController.text,
                              phone: _phoneController.text,
                              mobileNumbers: [_mobileController.text],
                            ),
                          ));
                          await bloc.submit(context);
                        }
                      },
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String isEmpty(value) => value.isEmpty ? "Cannot be empty" : null;
}
