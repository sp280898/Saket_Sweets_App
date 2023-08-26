// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..cart = (json['cart'] as List<dynamic>)
      .map((e) => FoodItemDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'cart': instance.cart,
    };
