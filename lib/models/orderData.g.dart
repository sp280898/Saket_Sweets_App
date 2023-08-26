// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderData _$OrderDataFromJson(Map<String, dynamic> json) => OrderData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..order = (json['order'] as List<dynamic>)
      .map((e) => OrderDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'order': instance.order,
    };
