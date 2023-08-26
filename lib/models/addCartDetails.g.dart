// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addCartDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCartDetails _$AddCartDetailsFromJson(Map<String, dynamic> json) =>
    AddCartDetails()
      ..id = json['id'] as num?
      ..user_id = json['user_id'] as String?
      ..food_id = json['food_id'] as String?
      ..plan_id = json['plan_id'] as String?
      ..request_tech = json['request_tech'] as String?
      ..offer_id = json['offer_id'] as String?
      ..quantity = json['quantity'] as String?
      ..price = json['price'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$AddCartDetailsToJson(AddCartDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'food_id': instance.food_id,
      'plan_id': instance.plan_id,
      'request_tech': instance.request_tech,
      'offer_id': instance.offer_id,
      'quantity': instance.quantity,
      'price': instance.price,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
