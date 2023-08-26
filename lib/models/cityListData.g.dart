// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cityListData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityListData _$CityListDataFromJson(Map<String, dynamic> json) => CityListData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..detail = CityListDetails.fromJson(json['detail'] as Map<String, dynamic>);

Map<String, dynamic> _$CityListDataToJson(CityListData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'detail': instance.detail,
    };
