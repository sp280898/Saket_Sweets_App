// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..profile = ProfileDetails.fromJson(json['profile'] as Map<String, dynamic>);

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'profile': instance.profile,
    };
