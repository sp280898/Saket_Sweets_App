import 'package:json_annotation/json_annotation.dart';

part 'addressDetails.g.dart';

@JsonSerializable()
class AddressDetails {
  AddressDetails();

  late num? id;
  late String? user_id;
  late String? address;
  late String? name;
  late String? mobile;
  late String? country;
  late String? state;
  late String? city;
  late String? pin_code;
  late String? primary_type;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory AddressDetails.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$AddressDetailsToJson(this);
}
