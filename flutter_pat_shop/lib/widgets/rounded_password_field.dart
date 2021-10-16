import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/constants.dart';
import 'package:flutter_pat_shop/widgets/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChange;

  const RoundedPasswordField(
      {Key? key,
      required this.onChange,})
      : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChange,
        obscureText: _obscureText,
        decoration: InputDecoration(
            hintText: "Password",
            icon: Icon(Icons.lock),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                Icons.visibility,
                color: _obscureText? Colors.grey : kPrimaryColor,
              ),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
