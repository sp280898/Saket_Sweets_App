import 'package:json_annotation/json_annotation.dart';
import "planDetails.dart";
part 'planData.g.dart';

@JsonSerializable()
class PlanData {
  PlanData();

  late num status;
  late String msg;
  late List<PlanDetails> plan;
  
  factory PlanData.fromJson(Map<String,dynamic> json) => _$PlanDataFromJson(json);
  Map<String, dynamic> toJson() => _$PlanDataToJson(this);
}
