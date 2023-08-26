import 'package:json_annotation/json_annotation.dart';
import "addressDetails.dart";
part 'primaryAddressData.g.dart';

@JsonSerializable()
class PrimaryAddressData {
  PrimaryAddressData();

  late num status;
  late String msg;
  late AddressDetails? primaryAddress;

  factory PrimaryAddressData.fromJson(Map<String, dynamic> json) =>
      _$PrimaryAddressDataFromJson(json);
  Map<String, dynamic> toJson() => _$PrimaryAddressDataToJson(this);
}
