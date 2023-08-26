// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptionData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionData _$SubscriptionDataFromJson(Map<String, dynamic> json) =>
    SubscriptionData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      ..sublist = (json['sublist'] as List<dynamic>)
          .map((e) => SubscriptionDetails.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SubscriptionDataToJson(SubscriptionData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'sublist': instance.sublist,
    };
