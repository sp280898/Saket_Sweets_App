// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pinCodeDetailsData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinCodeDetailsData _$PinCodeDetailsDataFromJson(Map<String, dynamic> json) =>
    PinCodeDetailsData()
      ..id = json['id'] as num?
      ..pin_code = json['pin_code'] as String?
      ..delivary_amount = json['delivary_amount'] as String?
      ..late_night_charge = json['late_night_charge'] as String?
      ..master = json['master'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$PinCodeDetailsDataToJson(PinCodeDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pin_code': instance.pin_code,
      'delivary_amount': instance.delivary_amount,
      'late_night_charge': instance.late_night_charge,
      'master': instance.master,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
