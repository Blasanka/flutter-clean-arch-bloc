import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function action;
  final bool isBusy;
  final IconData icon;

  final double _elevation = 3;

  const CustomButton({
    Key key,
    this.label,
    this.icon,
    this.action,
    this.isBusy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Expanded(
            child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 36.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                onPressed: action,
                elevation: _elevation,
                child: isBusy
                    ? CircularProgressIndicator()
                    : Text(label),
            ),
          ),
        ],
      ),
    );
  }
}