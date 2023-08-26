import 'package:flutter/material.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:saket_sweets_app/services/http_service_impl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/widgets/appBarWidget.dart';
import 'package:widget_mask/widget_mask.dart';

import '../controller/my_order_controller.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final controller = Get.find<MyOrderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget('Order List'),
        body: Obx(() {
          return controller.isLoading.isTrue
              ? const Center(child: CircularProgressIndicator())
              : controller.myOrderList.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return _itemOrder(
                            controller.myOrderList[index], context);
                      },
                      itemCount: controller.myOrderList.length,
                    )
                  : const Center(
                      child: Text('Empty List'),
                    );
        }));
  }

  Widget _itemOrder(MyOrderDetails _myOrderDetails, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 1)],
        borderRadius: BorderRadius.circular(10),
      ),
      // height: 150,
      child: Stack(
        children: [
          WidgetMask(
            blendMode: BlendMode.srcATop,
            childSaveLayer: true,
            child: const Image(
              image: AssetImage(
                './assets/images/bg2.png',
              ),
              width: 150,
              height: 140,
            ),
            mask: Container(
              width: 150,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      BASE_URL + _myOrderDetails.food_image.toString(),
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 150,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _myOrderDetails.food_name.toString(),
                            style: GoogleFonts.patuaOne(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            _myOrderDetails.food_description.toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Rs. ${_myOrderDetails.price.toString()}',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Positioned(
          //   bottom: 0,
          //   child: Row(
          //     children: [
          //       const SizedBox(
          //         width: 120,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(right: 8.0, left: 4.0),
          //             child: _myOrderDetails.delivery == '2'
          //                 ? const Text(
          //                     'Delivered',
          //                     style: TextStyle(
          //                         fontSize: 14,
          //                         fontWeight: FontWeight.bold,
          //                         color: Colors.green),
          //                     maxLines: 1,
          //                     overflow: TextOverflow.ellipsis,
          //                   )
          //                 : ElevatedButton(
          //                     onPressed: () => controller.getTrackStutas(
          //                         _myOrderDetails.order_id.toString()),
          //                     child: const Text('Track'),
          //                     style: ElevatedButton.styleFrom(
          //                       primary: Theme.of(context).primaryColor,
          //                     ),
          //                   ),
          //           )
          //         ],
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
