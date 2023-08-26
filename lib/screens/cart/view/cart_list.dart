import 'package:flutter/material.dart';
import 'package:saket_sweets_app/screens/cart/controller/cart_list_controller.dart';
import 'package:saket_sweets_app/widgets/item_cart.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/widgets/appBarWidget.dart';

class CartList extends GetView<CartListController> {
  // final controller = Get.find<>();
  CartList({Key? key}) : super(key: key) {
    controller.hitApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Cart List'),
      body: Obx(() {
        // return controller.isLoading.isTrue
        //     ? const Center(child: CircularProgressIndicator())
        //     :
        return controller.cartList.isNotEmpty
            ? RefreshIndicator(
                onRefresh: () async {
                  controller.hitApi();
                },
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        // physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        itemBuilder: (context, index) {
                          // return _itemCart(controller.cartList[index], context);
                          return ItemCart(
                              cartItem: controller.cartList[index],
                              index: index);
                        },
                        itemCount: controller.cartList.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\u{20B9} ${controller.totalPrice}',
                            style: TextStyle(
                                fontSize: 30,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.getPrimaryAddress();
                              if (controller.addressStutas == '201') {
                                dialog();
                              } else {
                                Get.toNamed('/invoice', arguments: [
                                  {'price': controller.totalPrice}
                                ]);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).primaryColor),
                              child: const Text(
                                'Check Out',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Empty List',
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          controller.hitApi();
                        },
                        child: const Text('Refresh'))
                  ],
                ),
              );
      }),
    );
  }

  dialog() {
    Get.defaultDialog(
      title: 'Please Add your address first',
      titleStyle: const TextStyle(fontWeight: FontWeight.w500),
      content: const SizedBox(
        height: 6,
      ),
      radius: 10.0,
      barrierDismissible: false,
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
          Get.toNamed('/addressPage');
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.teal,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
