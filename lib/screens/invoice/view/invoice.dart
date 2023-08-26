import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:saket_sweets_app/screens/invoice/controller/invoice_controller.dart';

class Invoice extends GetView<InvoiceController> {
  Invoice({Key? key}) : super(key: key) {
    // controller.hitApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Invoice'),
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.address == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:
                                  Theme.of(context).primaryColor.withAlpha(40),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivery Address:',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${controller.address.name}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '${controller.address.mobile}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        '${controller.address.address} - ${controller.address.pin_code}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Text(
                                //   'Change',
                                //   style: TextStyle(
                                //     fontSize: 14,
                                //     color: Theme.of(context).primaryColor,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bill Details :-',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(
                                  // height: 10,
                                  thickness: 1,
                                ),
                                Container(
                                  color: Colors.grey[200],
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 5.0),
                                  child: Row(
                                    children: const [
                                      Expanded(
                                        child: Text(
                                          'Sr No.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Food Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Qty',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'price',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Obx(() {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return _itemBuy(
                                          controller.cartList[index], index);
                                    },
                                    itemCount: controller.cartList.length,
                                  );
                                }),
                                const Divider(
                                  // height: 10,
                                  thickness: 1,
                                ),
                                Container(
                                  // color: Colors.grey[200],
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 3.0),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        child: Text(
                                          'Total Price :',
                                          style: TextStyle(
                                            fontSize: 14,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          controller.totalPrice,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Container(
                                //   // color: Colors.grey[200],
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 16.0, vertical: 3.0),
                                //   child: Row(
                                //     children: [
                                //       const Expanded(
                                //         child: Text(
                                //           'Delivery Charge :',
                                //           style: TextStyle(
                                //             fontSize: 14,
                                //             // fontWeight: FontWeight.bold,
                                //           ),
                                //           textAlign: TextAlign.end,
                                //         ),
                                //       ),
                                //       SizedBox(
                                //         width: 80,
                                //         child: Text(
                                //           controller.deliveryCharge,
                                //           style: const TextStyle(
                                //             fontSize: 14,
                                //             // fontWeight: FontWeight.bold,
                                //           ),
                                //           textAlign: TextAlign.end,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                const Divider(
                                  // height: 10,
                                  thickness: 1,
                                ),
                                Container(
                                  // color: Colors.grey[200],
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 6.0),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        child: Text(
                                          'Grand Total Price',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          '\u{20B9} ${int.parse(controller.totalPrice)}',
                                          // '\u{20B9} ${int.parse(controller.totalPrice) + int.parse(controller.deliveryCharge)}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Center(
                            child: GestureDetector(
                              onTap: () {
                                String address = controller.address.address! +
                                    '-' +
                                    controller.address.pin_code!;
                                int grandPrice =
                                    int.parse(controller.totalPrice);
                                DateTime now = DateTime.now();
                                String dateTimeStart =
                                    DateFormat('yyyy-MM-dd').format(now);
                                Get.offNamed('/paymetGetway', arguments: [
                                  {
                                    'route': 'cart',
                                    'userID': box.read('id').toString(),
                                    'planID': address,
                                    'dateTimeStart': dateTimeStart,
                                    'price': grandPrice.toString(),
                                  }
                                ]);
                                // Get.toNamed('/invoice', arguments: [
                                //   {'price': controller.totalPrice}
                                // ]);
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).primaryColor),
                                child: const Text(
                                  'Pay',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    );
        }));
  }

  Widget _itemBuy(FoodItemDetails cart, int index) {
    return Container(
      color: index % 2 == 0 ? Colors.white : Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${index + 1}',
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
              child: Text(
            '${cart.name}',
            textAlign: TextAlign.start,
          )),
          Expanded(
              child: Text(
            '${cart.quantity}',
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            // '${int.parse(cart.quantity!) * int.parse(cart.price!)}',
            '${int.parse(cart.total_price!)}',
            textAlign: TextAlign.end,
          )),
        ],
      ),
    );
  }
}
