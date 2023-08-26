// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myOrderDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrderDetails _$MyOrderDetailsFromJson(Map<String, dynamic> json) =>
    MyOrderDetails()
      ..id = json['id'] as num?
      ..food_name = json['food_name'] as String?
      ..quantity = json['quantity'] as String?
      ..price = json['price'] as String?
      ..payment_id = json['payment_id'] as String?
      ..user_id = json['user_id'] as String?
      ..Shiprocket_Shipment_Id = json['Shiprocket_Shipment_Id'] as String?
      ..Shiprocket_Order_Id = json['Shiprocket_Order_Id'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?
      ..order_date_time = json['order_date_time'] as String?
      ..delivery = json['delivery'] as String?
      ..estimate_delivarty_time = json['estimate_delivarty_time'] as String?
      ..order_id = json['order_id'] as num?
      ..final_price = json['final_price'] as String?
      ..delivery_charge = json['delivery_charge'] as String?
      ..late_night = json['late_night'] as String?
      ..food_description = json['food_description'] as String?
      ..food_image = json['food_image'] as String?
      ..food_ingredients = json['food_ingredients'] as String?
      ..food_recipe = json['food_recipe'] as String?
      ..veg_nveg = json['veg_nveg'] as String?;

Map<String, dynamic> _$MyOrderDetailsToJson(MyOrderDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'food_name': instance.food_name,
      'quantity': instance.quantity,
      'price': instance.price,
      'payment_id': instance.payment_id,
      'user_id': instance.user_id,
      'Shiprocket_Shipment_Id': instance.Shiprocket_Shipment_Id,
      'Shiprocket_Order_Id': instance.Shiprocket_Order_Id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
      'order_date_time': instance.order_date_time,
      'delivery': instance.delivery,
      'estimate_delivarty_time': instance.estimate_delivarty_time,
      'order_id': instance.order_id,
      'final_price': instance.final_price,
      'delivery_charge': instance.delivery_charge,
      'late_night': instance.late_night,
      'food_description': instance.food_description,
      'food_image': instance.food_image,
      'food_ingredients': instance.food_ingredients,
      'food_recipe': instance.food_recipe,
      'veg_nveg': instance.veg_nveg,
    };
