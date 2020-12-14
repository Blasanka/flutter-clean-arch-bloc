import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final Stream<dynamic> value;
  final Function(dynamic) onChange;
  final Function(String) validator;
  final TextInputType keyboardType;
  final String labelText;
  final String hintText;

  const CustomTextField(
      {Key key,
      this.controller,
      this.value,
      this.onChange,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.labelText = "",
      this.hintText = ""})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: widget.value,
        initialData: "",
        builder: (context, snapshot) {
          return TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            onChanged: (text) {
              if (widget.onChange != null) widget.onChange(text);
            },
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              hintText: snapshot.data ?? widget.hintText,
              labelText: widget.labelText,
              errorText: snapshot.error,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.0),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
              ),
            ),
          );
        });
  }
}
