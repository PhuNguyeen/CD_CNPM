// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specifications _$SpecificationsFromJson(Map<String, dynamic> json) {
  return Specifications(
    specificationsID: json['specificationsID'] as int,
    screen: json['screen'] as String,
    fontCamera: json['fontCamera'] as String,
    rearCamera: json['rearCamera'] as String,
    cpu: json['cpu'] as String,
    simSlot: json['simSlot'] as String,
    battery: json['battery'] as String,
    design: json['design'] as String,
    especially: json['especially'] as String,
    productDescription: json['productDescription'] as String,
  );
}

Map<String, dynamic> _$SpecificationsToJson(Specifications instance) =>
    <String, dynamic>{
      'specificationsID': instance.specificationsID,
      'screen': instance.screen,
      'fontCamera': instance.fontCamera,
      'rearCamera': instance.rearCamera,
      'cpu': instance.cpu,
      'simSlot': instance.simSlot,
      'battery': instance.battery,
      'design': instance.design,
      'especially': instance.especially,
      'productDescription': instance.productDescription,
    };
