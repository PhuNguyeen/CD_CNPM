import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String userID;
  String userName;
  final String userPhone;
  String userPass;
  String userEmail;
  String userAvatar;
  String userRole;

  User(this.userID, this.userName, this.userPhone, this.userPass,
      this.userEmail, this.userAvatar, this.userRole);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{userID: $userID, userName: $userName, userPhone: $userPhone, userPass: $userPass, userEmail: $userEmail, userAvatar: $userAvatar, userRole: $userRole}';
  }

}
