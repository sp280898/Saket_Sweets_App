import 'package:json_annotation/json_annotation.dart';
import "userDetails.dart";
part 'userData.g.dart';

@JsonSerializable()
class UserData {
  UserData();

  late num status;
  late String msg;
  late UserDetails? user;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
