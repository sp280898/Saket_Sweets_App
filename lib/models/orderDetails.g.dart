// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails()
  ..id = json['id'] as num?
  ..order_date_time = json['order_date_time'] as String?
  ..estimate_delivarty_time = json['estimate_delivarty_time'] as String?
  ..food_id = json['food_id'] as String?
  ..status = json['status'] as String?
  ..user_id = json['user_id'] as String?
  ..delivary_address = json['delivary_address'] as String?
  ..price = json['price'] as String?
  ..discount = json['discount'] as String?
  ..final_price = json['final_price'] as String?
  ..comment = json['comment'] as String?
  ..payment_type = json['payment_type'] as String?
  ..payment_id = json['payment_id'] as String?
  ..delivery = json['delivery'] as String?
  ..late_night = json['late_night'] as String?
  ..delivery_charge = json['delivery_charge'] as String?
  ..created_at = json['created_at'] as String?
  ..updated_at = json['updated_at'] as String?
  ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_date_time': instance.order_date_time,
      'estimate_delivarty_time': instance.estimate_delivarty_time,
      'food_id': instance.food_id,
      'status': instance.status,
      'user_id': instance.user_id,
      'delivary_address': instance.delivary_address,
      'price': instance.price,
      'discount': instance.discount,
      'final_price': instance.final_price,
      'comment': instance.comment,
      'payment_type': instance.payment_type,
      'payment_id': instance.payment_id,
      'delivery': instance.delivery,
      'late_night': instance.late_night,
      'delivery_charge': instance.delivery_charge,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
