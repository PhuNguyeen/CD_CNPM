// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    userID: json['userID'] as int,
    userName: json['userName'] as String,
    userPhone: json['userPhone'] as String,
    userPass: json['userPass'] as String?,
    userEmail: json['userEmail'] as String?,
    userAvatar: json['userAvatar'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userID': instance.userID,
      'userName': instance.userName,
      'userPass': instance.userPass,
      'userPhone': instance.userPhone,
      'userEmail': instance.userEmail,
      'userAvatar': instance.userAvatar,
    };
