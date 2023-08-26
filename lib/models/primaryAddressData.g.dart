// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primaryAddressData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrimaryAddressData _$PrimaryAddressDataFromJson(Map<String, dynamic> json) =>
    PrimaryAddressData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      ..primaryAddress = json['primaryAddress'] == null
          ? null
          : AddressDetails.fromJson(
              json['primaryAddress'] as Map<String, dynamic>);

Map<String, dynamic> _$PrimaryAddressDataToJson(PrimaryAddressData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'primaryAddress': instance.primaryAddress,
    };
