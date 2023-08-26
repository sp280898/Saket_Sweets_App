// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanData _$PlanDataFromJson(Map<String, dynamic> json) => PlanData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..plan = (json['plan'] as List<dynamic>)
      .map((e) => PlanDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$PlanDataToJson(PlanData instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'plan': instance.plan,
    };
