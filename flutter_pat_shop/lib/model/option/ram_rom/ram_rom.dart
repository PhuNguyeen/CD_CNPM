import 'package:json_annotation/json_annotation.dart';

part 'ram_rom.g.dart';

@JsonSerializable()
class RamRom {
  int ramRomID;
  int ramdetail;
  int romDetail;
  int price;
  RamRom({
    required this.ramRomID,
    required this.ramdetail,
    required this.romDetail,
    required this.price,
  });
  factory RamRom.fromJson(Map<String, dynamic> json) => _$RamRomFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RamRomToJson(this);

  @override
  String toString() {
    return 'RamRom(ramRomID: $ramRomID, ramdetail: $ramdetail, romDetail: $romDetail, price: $price)';
  }
}
