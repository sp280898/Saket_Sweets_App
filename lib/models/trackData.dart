import 'package:json_annotation/json_annotation.dart';
import "myOrderDetails.dart";
part 'trackData.g.dart';

@JsonSerializable()
class TrackData {
  TrackData();

  late num status;
  late String msg;
  late MyOrderDetails track;
  
  factory TrackData.fromJson(Map<String,dynamic> json) => _$TrackDataFromJson(json);
  Map<String, dynamic> toJson() => _$TrackDataToJson(this);
}
