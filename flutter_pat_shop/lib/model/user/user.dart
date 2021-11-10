import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  int userID;
  String userName;
  String? userPass;
  final String userPhone;
  String? userEmail;
  String? userAvatar;

  User(
      {required this.userID,
      required this.userName,
      required this.userPhone,
      this.userPass,
      required this.userEmail,
      this.userAvatar});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{userID: $userID, userName: $userName, userPhone: $userPhone, userPass: $userPass, userEmail: $userEmail, userAvatar: $userAvatar,}';
  }
}
