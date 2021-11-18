// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ram_rom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RamRom _$RamRomFromJson(Map<String, dynamic> json) {
  return RamRom(
    ramRomID: json['ramRomID'] as int,
    ramdetail: json['ramdetail'] as int,
    romDetail: json['romDetail'] as int,
    price: json['price'] as int,
  );
}

Map<String, dynamic> _$RamRomToJson(RamRom instance) => <String, dynamic>{
      'ramRomID': instance.ramRomID,
      'ramdetail': instance.ramdetail,
      'romDetail': instance.romDetail,
      'price': instance.price,
    };
