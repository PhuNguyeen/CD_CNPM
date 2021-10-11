import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/widgets/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChange;
  const RoundedPasswordField({Key? key, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChange,
        obscureText: true,
        decoration: InputDecoration(
            hintText: "Password",
            icon: Icon(Icons.lock),
            suffixIcon: Icon(
              Icons.visibility,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
