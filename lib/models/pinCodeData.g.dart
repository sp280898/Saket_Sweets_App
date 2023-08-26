// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pinCodeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinCodeData _$PinCodeDataFromJson(Map<String, dynamic> json) => PinCodeData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..pincode = json['pincode'] == null
      ? null
      : PinCodeDetailsData.fromJson(json['pincode'] as Map<String, dynamic>);

Map<String, dynamic> _$PinCodeDataToJson(PinCodeData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'pincode': instance.pincode,
    };
