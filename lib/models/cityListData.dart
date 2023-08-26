import 'package:json_annotation/json_annotation.dart';
import "cityListDetails.dart";
part 'cityListData.g.dart';

@JsonSerializable()
class CityListData {
  CityListData();

  late num status;
  late String msg;
  late CityListDetails detail;
  
  factory CityListData.fromJson(Map<String,dynamic> json) => _$CityListDataFromJson(json);
  Map<String, dynamic> toJson() => _$CityListDataToJson(this);
}
