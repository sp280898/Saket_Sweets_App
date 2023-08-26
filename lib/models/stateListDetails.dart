import 'package:json_annotation/json_annotation.dart';

part 'stateListDetails.g.dart';

@JsonSerializable()
class StateListDetails {
  StateListDetails();

  late String name;
  late String short_name;
  
  factory StateListDetails.fromJson(Map<String,dynamic> json) => _$StateListDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$StateListDetailsToJson(this);
}
