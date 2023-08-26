// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addressData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressData _$AddressDataFromJson(Map<String, dynamic> json) => AddressData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..address = (json['address'] as List<dynamic>)
      .map((e) => AddressDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$AddressDataToJson(AddressData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'address': instance.address,
    };
