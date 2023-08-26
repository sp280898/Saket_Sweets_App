// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stateListData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateListData _$StateListDataFromJson(Map<String, dynamic> json) =>
    StateListData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      ..detail = (json['detail'] as List<dynamic>)
          .map((e) => StateListDetails.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$StateListDataToJson(StateListData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'detail': instance.detail,
    };
