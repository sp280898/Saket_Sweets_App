import 'package:json_annotation/json_annotation.dart';

part 'pinCodeDetailsData.g.dart';

@JsonSerializable()
class PinCodeDetailsData {
  PinCodeDetailsData();

  late num? id;
  late String? pin_code;
  late String? delivary_amount;
  late String? late_night_charge;
  late String? master;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory PinCodeDetailsData.fromJson(Map<String, dynamic> json) =>
      _$PinCodeDetailsDataFromJson(json);
  Map<String, dynamic> toJson() => _$PinCodeDetailsDataToJson(this);
}
