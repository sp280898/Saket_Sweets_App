// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foodItemDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodItemDetails _$FoodItemDetailsFromJson(Map<String, dynamic> json) =>
    FoodItemDetails()
      ..id = json['id'] as num?
      ..name = json['name'] as String?
      ..category = json['category'] as String?
      ..type = json['type'] as String?
      ..description = json['description'] as String?
      ..image = json['image'] as String?
      ..ingredients = json['ingredients'] as String?
      ..recipe = json['recipe'] as String?
      ..active = json['active'] as String?
      ..status = json['status'] as String?
      ..price = json['price'] as String?
      ..mainprice = json['mainprice'] as String?
      ..subfood_id = json['subfood_id'] as String?
      ..available_plans = json['available_plans'] as String?
      ..available_offer = json['available_offer'] as String?
      ..max_quantity = json['max_quantity'] as String?
      ..times_to_delivery_chrage = json['times_to_delivery_chrage'] as String?
      ..veg_nveg = json['veg_nveg'] as String?
      ..shop_user = json['shop_user'] as String?
      ..retailer_price = json['retailer_price'] as String?
      ..wholesaler_price = json['wholesaler_price'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?
      ..quantity = json['quantity'] as String?
      ..total_price = json['total_price'] as String?
      ..cart_id = json['cart_id'] as num?
      ..fav_id = json['fav_id'] as num?;

Map<String, dynamic> _$FoodItemDetailsToJson(FoodItemDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'type': instance.type,
      'description': instance.description,
      'image': instance.image,
      'ingredients': instance.ingredients,
      'recipe': instance.recipe,
      'active': instance.active,
      'status': instance.status,
      'price': instance.price,
      'mainprice': instance.mainprice,
      'subfood_id': instance.subfood_id,
      'available_plans': instance.available_plans,
      'available_offer': instance.available_offer,
      'max_quantity': instance.max_quantity,
      'times_to_delivery_chrage': instance.times_to_delivery_chrage,
      'veg_nveg': instance.veg_nveg,
      'shop_user': instance.shop_user,
      'retailer_price': instance.retailer_price,
      'wholesaler_price': instance.wholesaler_price,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
      'quantity': instance.quantity,
      'total_price': instance.total_price,
      'cart_id': instance.cart_id,
      'fav_id': instance.fav_id,
    };
