import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/util/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  final String? labelText;
  final TextInputType? textInputType;
  final Icon? icon;

  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon,
    required this.onChanged,
    this.textInputType,
    this.controller,
    this.errorText,
    this.labelText,
    this.hintStyle,
    this.onSubmitted, this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
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
