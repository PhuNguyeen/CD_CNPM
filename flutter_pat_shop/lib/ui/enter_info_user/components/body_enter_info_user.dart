import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/user/user.dart';
import 'package:flutter_pat_shop/ui/enter_info_user/enter_info_user_view_model.dart';
import 'package:flutter_pat_shop/ui/login/login_screen.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_pat_shop/util/my_snack_bar.dart';
import 'package:flutter_pat_shop/util/show_dialog_loading.dart';
import 'package:flutter_pat_shop/util/validation.dart';
import 'package:flutter_pat_shop/util/widgets/profile_widget.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_input_field.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_password_field.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:scoped_model/scoped_model.dart';

class BodyEnterInfoUser extends StatefulWidget {
  final String phoneNumber;

  BodyEnterInfoUser({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _BodyEnterInfoUserState createState() => _BodyEnterInfoUserState();
}

class _BodyEnterInfoUserState extends State<BodyEnterInfoUser> {
  late User _user;
  String? userName;
  String? userPass;
  String? userConfPass;
  File? _image;
  final picker = ImagePicker();

  @override
  void initState() {
    _user = User(
        userID: "", userName: "", userPhone: widget.phoneNumber, userEmail: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EnterInfoUserViewModel enterInfoUserViewModel =
        EnterInfoUserViewModel.getInstace();

    return ScopedModel(
      model: enterInfoUserViewModel,
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
        children: [
          ProfileWidget(
            image: _image == null ? null : Image.file(_image!),
            onClicked: () {
              choiceImage();
            },
            icon: Icon(
              Icons.edit,
              color: Colors.white,
              size: 20,
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          RoundedInputField(
            hintText: "Your name",
            onChanged: (value) {
              setState(() {
                userName = value.toString();
              });
            },
            icon: Icon(Icons.person),
            errorText:
                userName == null ? null : Validation.validateName(userName!),
          ),
          const SizedBox(
            height: 6,
          ),
          RoundedPasswordField(
            hintText: "Password",
            onChanged: (value) {
              setState(() {
                userPass = value.toString();
              });
            },
            errorText: userPass == null
                ? null
                : Validation.validatePassword(userPass!),
          ),
          const SizedBox(
            height: 6,
          ),
          RoundedPasswordField(
            hintText: "Confirm Password",
            onChanged: (value) {
              setState(() {
                userConfPass = value.toString();
              });
            },
            errorText: userConfPass == null
                ? null
                : Validation.validateConfirmPassword(userPass!, userConfPass!),
          ),
          const SizedBox(
            height: 6,
          ),
          RoundedButton(
            text: "Save",
            press: isValidateAll()
                ? () async {
                    ShowDialogLoading.showDialogLoading(context);
                    _user.userName = userName!;
                    Map<String, dynamic> data = _user.toJson();
                    print(data);
                    Future.delayed(
                      Duration(seconds: 3),
                      () async {
                        final result = await enterInfoUserViewModel
                            .updateMessage(data, _image);
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
        ],
      ),
    );
  }

  bool isValidateAll() {
    if (userName == null || userPass == null || userConfPass == null) {
      return false;
    } else {
      if (Validation.validateName(userName!) != null ||
          Validation.validatePassword(userPass!) != null ||
          Validation.validateConfirmPassword(userPass!, userConfPass!) !=
              null) {
        return false;
      }
    }
    return true;
  }

  createUser(Map<String, dynamic> jsonData) async {
    final apiLink = Uri.parse("$LINK_API/user/create.php");

    var request = http.MultipartRequest("POST", apiLink);
    request.fields['data'] = jsonEncode(jsonData);

    if (_image != null) {
      var pic = await http.MultipartFile.fromPath("file", _image!.path,
          contentType: new MediaType("image", "jpg"));
      request.files.add(pic);
      print(_image!.path);
    }

    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      MySnackBar.snackBar(json['message']['create'], context);
      if (json['message']['create']
          .toString()
          .toUpperCase()
          .contains("Successful.".toUpperCase())) {}
      print(json['message']);
      MySnackBar.snackBar("Successful!", context);
    } else {
      MySnackBar.snackBar("Error!", context);
    }
  }

  choiceImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        // print(pickedImage!.path);
      });
    }
  }
}
