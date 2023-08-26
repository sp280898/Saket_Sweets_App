// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myOrderItemData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrderItemData _$MyOrderItemDataFromJson(Map<String, dynamic> json) =>
    MyOrderItemData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      // ..orderItem = (json['orderItem'] as List<dynamic>)
      //     .map((e) => MyOrderDetails.fromJson(e as Map<String, dynamic>))
      //     .toList()
      ..item = (json['item'] as List<dynamic>)
          .map((e) => MyOrderDetails.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MyOrderItemDataToJson(MyOrderItemData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      // 'orderItem': instance.orderItem,
      'item': instance.item,
    };
