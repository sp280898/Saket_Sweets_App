// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails()
  ..id = json['id'] as num?
  ..name = json['name'] as String?
  ..email = json['email'] as String?
  ..firebase_id = json['firebase_id'] as String?
  ..email_verified_at = json['email_verified_at'] as String?
  ..mobile = json['mobile'] as String?
  ..image = json['image'] as String?
  ..address = json['address'] as String?
  ..gender = json['gender'] as String?
  ..device_token = json['device_token'] as String?
  ..user_type = json['user_type'] as String?
  ..created_at = json['created_at'] as String?
  ..updated_at = json['updated_at'] as String?
  ..deleted_at = json['deleted_at'] as String?
  ..profile_photo_url = json['profile_photo_url'] as String?;

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'firebase_id': instance.firebase_id,
      'email_verified_at': instance.email_verified_at,
      'mobile': instance.mobile,
      'image': instance.image,
      'address': instance.address,
      'gender': instance.gender,
      'device_token': instance.device_token,
      'user_type': instance.user_type,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
      'profile_photo_url': instance.profile_photo_url,
    };
