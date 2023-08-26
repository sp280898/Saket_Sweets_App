import 'package:json_annotation/json_annotation.dart';
import "stateListDetails.dart";
part 'stateListData.g.dart';

@JsonSerializable()
class StateListData {
  StateListData();

  late num status;
  late String msg;
  late List<StateListDetails> detail;
  
  factory StateListData.fromJson(Map<String,dynamic> json) => _$StateListDataFromJson(json);
  Map<String, dynamic> toJson() => _$StateListDataToJson(this);
}
