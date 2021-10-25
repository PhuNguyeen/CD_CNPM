// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['userID'] as String,
    json['userName'] as String,
    json['userPhone'] as String,
    json['userEmail'] as String,
    json['userAvatar'] as String,
    json['userRole'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userID': instance.userID,
      'userName': instance.userName,
      'userPhone': instance.userPhone,
      'userEmail': instance.userEmail,
      'userAvatar': instance.userAvatar,
      'userRole': instance.userRole,
    };
