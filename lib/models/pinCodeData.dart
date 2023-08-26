import 'package:json_annotation/json_annotation.dart';
import "pinCodeDetailsData.dart";
part 'pinCodeData.g.dart';

@JsonSerializable()
class PinCodeData {
  PinCodeData();

  late num status;
  late String msg;
  late PinCodeDetailsData? pincode;

  factory PinCodeData.fromJson(Map<String, dynamic> json) =>
      _$PinCodeDataFromJson(json);
  Map<String, dynamic> toJson() => _$PinCodeDataToJson(this);
}
