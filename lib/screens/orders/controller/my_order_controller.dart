import 'package:flutter/material.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController {
  late Repo _repo;
  RxBool isLoading = false.obs;
  String id = '';

  MyOrderController() {
    _repo = Get.find<RepoImpl>();
    String userID = box.read('id').toString();
    hitApi(userID);
  }

  var myOrderList = <MyOrderDetails>[].obs;

  getFoodList(String userID) async {
    isLoading.toggle();
    try {
      final result = await _repo.getMyOrderList(userID);

      if (result != null) {
        if (result.status == 200) {
          myOrderList.value = result.item;
          print(myOrderList.length.toString());
        } else if (result.status == 201) {
          print('201');
        } else {
          print('Something went wrong');
        }
      }
    } on Exception catch (e) {
      // TODO

    } finally {
      isLoading.toggle();
    }
  }

  void getTrackStutas(String orderID) async {
    // isLoading.toggle();
    try {
      final result = await _repo.getTrackStutas(orderID);
      if (result != null) {
        if (result.status == 200) {
          if (result.track.delivery == "0") {
            dialog('Under process');
          } else if (result.track.delivery == "1") {
            dialog('Dispatched');
          } else if (result.track.delivery == "2") {
            dialog('Delivered');
          }
        } else if (result.status == 201) {
          print('${result.status} : ${result.msg}');
        } else {
          print('Something went wrong');
        }
      }
    } on Exception catch (e) {
      // TODO

    } finally {
      // isLoading.toggle();
    }
  }

  hitApi(String userID) {
    getFoodList(userID);
  }

  dialog(String status) {
    Get.defaultDialog(
      title: 'Order Status',
      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
      content: Text(
        status,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 23, color: Colors.green),
      ),
      radius: 10.0,
      barrierDismissible: false,
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.teal,
            // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        child: const Text(
          'ok',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
