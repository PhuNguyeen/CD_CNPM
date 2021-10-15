import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType? textInputType;
  final TextEditingController? controller;

  const RoundedInputField(
      {Key? key,
      required this.hintText,
      this.icon = Icons.phone,
      required this.onChanged,
      this.textInputType,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: textInputType,
        decoration: InputDecoration(
            hintText: hintText, icon: Icon(icon), border: InputBorder.none),
      ),
    );
  }
}
