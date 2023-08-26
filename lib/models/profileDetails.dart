import 'package:json_annotation/json_annotation.dart';

part 'profileDetails.g.dart';

@JsonSerializable()
class ProfileDetails {
  ProfileDetails();

  late num? id;
  late String? name;
  late String? email;
  late String? firebase_id;
  late String? email_verified_at;
  late String? password;
  late String? remember_token;
  late String? mobile;
  late String? image;
  late String? address;
  late String? gender;
  late String? device_token;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory ProfileDetails.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDetailsToJson(this);
}
