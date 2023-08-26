// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editCartData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditCartData _$EditCartDataFromJson(Map<String, dynamic> json) => EditCartData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..cart = EditCartDetailsData.fromJson(json['cart'] as Map<String, dynamic>);

Map<String, dynamic> _$EditCartDataToJson(EditCartData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'cart': instance.cart,
    };
