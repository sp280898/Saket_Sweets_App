// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptionDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionDetails _$SubscriptionDetailsFromJson(Map<String, dynamic> json) =>
    SubscriptionDetails()
      ..id = json['id'] as num?
      ..plan_id = json['plan_id'] as String?
      ..user_id = json['user_id'] as String?
      ..food_id = json['food_id'] as String?
      ..date_time_start = json['date_time_start'] as String?
      ..date_time_end = json['date_time_end'] as String?
      ..is_paid_full = json['is_paid_full'] as String?
      ..is_active = json['is_active'] as String?
      ..date_time_cancel = json['date_time_cancel'] as String?
      ..actual_date_time_end = json['actual_date_time_end'] as String?
      ..payment_type = json['payment_type'] as String?
      ..payment_id = json['payment_id'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?
      ..plan_name = json['plan_name'] as String?
      ..plan_type = json['plan_type'] as String?;

Map<String, dynamic> _$SubscriptionDetailsToJson(
        SubscriptionDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_id': instance.plan_id,
      'user_id': instance.user_id,
      'food_id': instance.food_id,
      'date_time_start': instance.date_time_start,
      'date_time_end': instance.date_time_end,
      'is_paid_full': instance.is_paid_full,
      'is_active': instance.is_active,
      'date_time_cancel': instance.date_time_cancel,
      'actual_date_time_end': instance.actual_date_time_end,
      'payment_type': instance.payment_type,
      'payment_id': instance.payment_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
      'plan_name': instance.plan_name,
      'plan_type': instance.plan_type,
    };
