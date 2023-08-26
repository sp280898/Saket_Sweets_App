import 'package:json_annotation/json_annotation.dart';

part 'userDetails.g.dart';

@JsonSerializable()
class UserDetails {
  UserDetails();

  late num? id;
  late String? name;
  late String? email;
  late String? firebase_id;
  late String? email_verified_at;
  late String? mobile;
  late String? image;
  late String? address;
  late String? gender;
  late String? device_token;
  late String? user_type;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;
  late String? profile_photo_url;

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
