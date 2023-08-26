import 'package:json_annotation/json_annotation.dart';
import "profileDetails.dart";
part 'profileData.g.dart';

@JsonSerializable()
class ProfileData {
  ProfileData();

  late num status;
  late String msg;
  late ProfileDetails profile;
  
  factory ProfileData.fromJson(Map<String,dynamic> json) => _$ProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}
