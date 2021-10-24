import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/user.dart';
import 'package:flutter_pat_shop/screens/enter_info_user/components/background_enter_info_user.dart';
import 'package:flutter_pat_shop/screens/login/login_screen.dart';
import 'package:flutter_pat_shop/until/constants.dart';
import 'package:flutter_pat_shop/until/my_snack_bar.dart';
import 'package:flutter_pat_shop/until/validation.dart';
import 'package:flutter_pat_shop/widgets/profile_widget.dart';
import 'package:flutter_pat_shop/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/widgets/rounded_input_field.dart';
import 'package:flutter_pat_shop/widgets/rounded_password_field.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';

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
    _user = User("", "", widget.phoneNumber, "", "", "abc.png", "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackgroundEnterInfoUser(
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
                ? () {
                    _user.userName = userName!;
                    _user.userPass = userPass!;
                    _user.userAvatar = "abc.png";

                    Map<String, dynamic> jsonData = _user.toJson();
                    createUser(jsonData);
                    print(_user.toJson());
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
    final apiLink = Uri.parse(LINK_API + "user/create.php");

    var request = http.MultipartRequest("POST", apiLink);
    request.fields['data'] = jsonEncode(jsonData);

    if (_image == null) {
      // _image = await _fileFromImageUrl();
    } else {
      var pic = await http.MultipartFile.fromPath("file", _image!.path,
          contentType: new MediaType("image", "jpg"));
      request.files.add(pic);
      print(_image!.path);
    }
    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      MySnackBar.snackBar(json['message'], context);
      if (json['message']
          .toString()
          .toUpperCase()
          .contains("Create User successful".toUpperCase())) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return LoginScreen();
            },
          ),
          (route) => false,
        );
      }
      print(json['message']);
      MySnackBar.snackBar("Successful!", context);
    } else {
      MySnackBar.snackBar("Error!", context);
    }
  }

  Future<File> _fileFromImageUrl() async {
    final response = await http.get(Uri.parse(LINK_IMAGE_TEST));

    final documentDirectory = await getApplicationDocumentsDirectory();

    final file = File(documentDirectory.path + 'imagetest.png');

    file.writeAsBytesSync(response.bodyBytes);

    return file;
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
