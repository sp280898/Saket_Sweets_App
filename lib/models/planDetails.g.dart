// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanDetails _$PlanDetailsFromJson(Map<String, dynamic> json) => PlanDetails()
  ..id = json['id'] as num?
  ..valid_date_time_from = json['valid_date_time_from'] as String?
  ..valid_date_time_to = json['valid_date_time_to'] as String?
  ..name = json['name'] as String?
  ..type = json['type'] as String?
  ..price = json['price'] as String?
  ..advance_price = json['advance_price'] as String?
  ..offer_discount = json['offer_discount'] as String?
  ..created_at = json['created_at'] as String?
  ..updated_at = json['updated_at'] as String?
  ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$PlanDetailsToJson(PlanDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'valid_date_time_from': instance.valid_date_time_from,
      'valid_date_time_to': instance.valid_date_time_to,
      'name': instance.name,
      'type': instance.type,
      'price': instance.price,
      'advance_price': instance.advance_price,
      'offer_discount': instance.offer_discount,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
