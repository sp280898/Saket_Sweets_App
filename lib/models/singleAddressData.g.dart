// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singleAddressData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleAddressData _$SingleAddressDataFromJson(Map<String, dynamic> json) =>
    SingleAddressData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      ..address =
          AddressDetails.fromJson(json['address'] as Map<String, dynamic>);

Map<String, dynamic> _$SingleAddressDataToJson(SingleAddressData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'address': instance.address,
    };
