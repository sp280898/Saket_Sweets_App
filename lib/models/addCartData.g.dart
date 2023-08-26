// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addCartData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCartData _$AddCartDataFromJson(Map<String, dynamic> json) => AddCartData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..cart = (json['cart'] as List<dynamic>)
      .map((e) => AddCartDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$AddCartDataToJson(AddCartData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'cart': instance.cart,
    };
