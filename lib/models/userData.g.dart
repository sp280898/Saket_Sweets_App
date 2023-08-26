// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..user = json['user'] == null
      ? null
      : UserDetails.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'user': instance.user,
    };
