import 'package:json_annotation/json_annotation.dart';

part 'specifications.g.dart';

@JsonSerializable()
class Specifications {
  int specificationsID;
  String screen;
  String fontCamera;
  String rearCamera;
  String cpu;
  String simSlot;
  String battery;
  String design;
  String especially;
  int productID;
  Specifications({
    required this.specificationsID,
    required this.screen,
    required this.fontCamera,
    required this.rearCamera,
    required this.cpu,
    required this.simSlot,
    required this.battery,
    required this.design,
    required this.especially,
    required this.productID,
  });
  factory Specifications.fromJson(Map<String, dynamic> json) =>
      _$SpecificationsFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SpecificationsToJson(this);

  @override
  String toString() {
    return 'Specifications(specificationsID: $specificationsID, screen: $screen, fontCamera: $fontCamera, rearCamera: $rearCamera, cpu: $cpu, simSlot: $simSlot, battery: $battery, design: $design, especially: $especially, productID: $productID)';
  }
}
