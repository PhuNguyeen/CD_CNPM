import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/util/widgets/text_field_container.dart';
import 'package:phone_form_field/phone_form_field.dart';

class RoundedPhoneField extends StatelessWidget {
  final String hintText;
  final IconData icon;

  final String? errorText;
  final ValueChanged onChanged;
  final TextInputType? textInputType;
  final controller;

  RoundedPhoneField(
      {Key? key,
      required this.hintText,
      this.icon = Icons.phone,
      required this.onChanged,
      this.textInputType,
      this.controller,
      this.errorText,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: PhoneFormField(
        defaultCountry: 'VN',
        autofocus: true,
        selectorNavigator: ModalBottomSheetNavigator(
          countries: [Country('VN')],
        ),
        onChanged: onChanged,
        controller: controller,
        errorText: errorText.toString(),
        showFlagInInput: true,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
