// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String;

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
