import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/enter_info_user/enter_info_user_view_model.dart';
import 'package:flutter_pat_shop/ui/login/login_screen.dart';
import 'package:flutter_pat_shop/util/my_snack_bar.dart';
import 'package:flutter_pat_shop/util/show_dialog_loading.dart';
import 'package:flutter_pat_shop/util/validation.dart';
import 'package:flutter_pat_shop/util/widgets/profile_widget.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_input_field.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_password_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';

class BodyEnterInfoUser extends StatefulWidget {
  final String userPhone;

  BodyEnterInfoUser({Key? key, required this.userPhone}) : super(key: key);

  @override
  _BodyEnterInfoUserState createState() => _BodyEnterInfoUserState();
}

class _BodyEnterInfoUserState extends State<BodyEnterInfoUser> {
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      physics: ScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      children: [
        ScopedModelDescendant<EnterInfoUserViewModel>(
          builder: (context, child, model) => ProfileWidget(
            image: model.image == null ? null : Image.file(model.image!),
            onClicked: () async {
              model.updateFileAvatar(await choiceImage());
            },
            icon: Icon(
              Icons.edit,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.1,
        ),
        ScopedModelDescendant<EnterInfoUserViewModel>(
          builder: (context, child, model) => RoundedInputField(
            hintText: "Your name",
            onChanged: (value) {
              model.updateUserName(value);
            },
            icon: Icon(Icons.person),
            errorText: model.userName == null
                ? null
                : Validation.validateName(model.userName!),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        ScopedModelDescendant<EnterInfoUserViewModel>(
          builder: (context, child, model) => RoundedPasswordField(
            hintText: "Password",
            onChanged: (value) {
              model.updateUserPass(value);
            },
            errorText: model.userPass == null
                ? null
                : Validation.validatePassword(model.userPass!),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        ScopedModelDescendant<EnterInfoUserViewModel>(
          builder: (context, child, model) => RoundedPasswordField(
            hintText: "Confirm Password",
            onChanged: (value) {
              model.updateUserConfPass(value);
            },
            errorText: model.userConfPass == null
                ? null
                : Validation.validateConfirmPassword(
                    model.userPass!, model.userConfPass!),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        ScopedModelDescendant<EnterInfoUserViewModel>(
          builder: (context, child, model) => RoundedButton(
            text: "Save",
            press: model.isValidateAll
                ? () async {
                    ShowDialogLoading.showDialogLoading(context);
                    Future.delayed(
                      Duration(seconds: 1),
                      () async {
                        final result = await model.createUser(widget.userPhone);
                        if (model.image != null) {
                          model.updateAvatar(widget.userPhone);
                        }
                        if (result) {
                          Navigator.pop(context);
                          MySnackBar.snackBar("Successful!", context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return LoginScreen();
                              },
                            ),
                            (route) => false,
                          );
                        } else {
                          Navigator.pop(context);
                          MySnackBar.snackBar(
                              "Create account failed!", context);
                        }
                      },
                    );
                  }
                : null,
          ),
        ),
      ],
    );
  }

  Future<File?> choiceImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }
}
