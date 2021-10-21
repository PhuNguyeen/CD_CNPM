import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  final String? labelText;
  final TextInputType? textInputType;
  final Icon? icon;

  final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  const RoundedInputField(
      {Key? key,
      required this.hintText,
      this.icon,
      required this.onChanged,
      this.textInputType,
      this.controller,
      this.errorText,
      this.labelText,
      this.hintStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
          icon: icon,
          border: InputBorder.none,
          errorText: errorText,
          errorMaxLines: 2,
          labelText: labelText,
          hintStyle: hintStyle,
        ),
      ),
    );
  }
}
