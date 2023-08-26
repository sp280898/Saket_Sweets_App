// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDetails _$ProfileDetailsFromJson(Map<String, dynamic> json) =>
    ProfileDetails()
      ..id = json['id'] as num?
      ..name = json['name'] as String?
      ..email = json['email'] as String?
      ..firebase_id = json['firebase_id'] as String?
      ..email_verified_at = json['email_verified_at'] as String?
      ..password = json['password'] as String?
      ..remember_token = json['remember_token'] as String?
      ..mobile = json['mobile'] as String?
      ..image = json['image'] as String?
      ..address = json['address'] as String?
      ..gender = json['gender'] as String?
      ..device_token = json['device_token'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$ProfileDetailsToJson(ProfileDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'firebase_id': instance.firebase_id,
      'email_verified_at': instance.email_verified_at,
      'password': instance.password,
      'remember_token': instance.remember_token,
      'mobile': instance.mobile,
      'image': instance.image,
      'address': instance.address,
      'gender': instance.gender,
      'device_token': instance.device_token,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
