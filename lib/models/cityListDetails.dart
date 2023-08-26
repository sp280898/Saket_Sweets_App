import 'package:json_annotation/json_annotation.dart';

part 'cityListDetails.g.dart';

@JsonSerializable()
class CityListDetails {
  CityListDetails();

  late List<String> city;
  
  factory CityListDetails.fromJson(Map<String,dynamic> json) => _$CityListDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CityListDetailsToJson(this);
}
