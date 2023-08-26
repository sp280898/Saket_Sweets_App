// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addressDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDetails _$AddressDetailsFromJson(Map<String, dynamic> json) =>
    AddressDetails()
      ..id = json['id'] as num?
      ..user_id = json['user_id'] as String?
      ..address = json['address'] as String?
      ..name = json['name'] as String?
      ..mobile = json['mobile'] as String?
      ..country = json['country'] as String?
      ..state = json['state'] as String?
      ..mobile = json['mobile'] as String?
      ..pin_code = json['pin_code'] as String?
      ..primary_type = json['primary_type'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$AddressDetailsToJson(AddressDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'address': instance.address,
      'name': instance.name,
      'mobile': instance.mobile,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'pin_code': instance.pin_code,
      'primary_type': instance.primary_type,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
