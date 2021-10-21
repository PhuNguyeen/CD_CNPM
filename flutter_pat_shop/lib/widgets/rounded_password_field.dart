import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/until/constants.dart';
import 'package:flutter_pat_shop/widgets/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  final String? labelText;
  final TextInputType? textInputType;
  final Icon? icon;

  final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  RoundedPasswordField(
      {required this.hintText,
      this.hintStyle,
      this.errorText,
      this.labelText,
      this.textInputType,
      this.icon,
      required this.onChanged,
      this.controller});

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: _obscureText,
        decoration: InputDecoration(
            hintText: widget.hintText,
            icon: Icon(Icons.lock),
            errorText: widget.errorText,
            hintStyle: widget.hintStyle,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                Icons.visibility,
                color: _obscureText ? Colors.grey : kPrimaryColor,
              ),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
