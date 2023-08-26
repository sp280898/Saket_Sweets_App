import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/screens/categories_product_list/view/categories_product_list.dart';
import 'package:saket_sweets_app/screens/food_list/controller/food_list_controller.dart';
import 'package:saket_sweets_app/services/http_service_impl.dart';
import 'package:saket_sweets_app/widgets/appBarWidget.dart';

import '../../../models/index.dart';

class FoodList extends StatefulWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final controller = Get.find<FoodListController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Food List'),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.foodItemList.isEmpty
                ? const Center(
                    child: Text('Empty List'),
                  )
                : Container(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return _itemProduct(
                            index, controller.foodItemList[index]);
                      },
                      itemCount: controller.foodItemList.length,
                    ),
                  );
      }),
    );
  }

  Widget _itemProduct(int index, FoodItemDetails _data) {
    return GestureDetector(
      onTap: () => Get.toNamed('/detailsPage', arguments: [
        {
          'id': _data.id.toString(),
          'route': 'foodItem',
          'index': index.toString(),
        }
      ]),
      child: Container(
        height: 140,
        margin: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Container(
              width: double.infinity,
              height: 130,
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.amber,
                      padding: const EdgeInsets.only(
                          bottom: 4.0, top: 8.0, left: 8.0, right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _data.name.toString(),
                                  style: GoogleFonts.patuaOne(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  _data.ingredients.toString(),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                // _data.mainprice.toString() ==
                                //         _data.price.toString()
                                //     ? SizedBox.shrink()
                                //     : Text(
                                //         'Rs. ${_data.mainprice.toString()}',
                                //         style: const TextStyle(
                                //           decoration:
                                //               TextDecoration.lineThrough,
                                //           fontSize: 12,
                                //         ),
                                //         maxLines: 1,
                                //         overflow: TextOverflow.ellipsis,
                                //       ),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // _data.mainprice.toString() ==
                                //         _data.price.toString()
                                //     ? Text(
                                //         'Rs. ${_data.price.toString()}',
                                //         style: TextStyle(
                                //             fontSize: 12,
                                //             fontWeight: FontWeight.bold,
                                //             color:
                                //                 Theme.of(context).primaryColor),
                                //         maxLines: 1,
                                //         overflow: TextOverflow.ellipsis,
                                //       )
                                //     : Text(
                                //         'Offer Rs. ${_data.price.toString()}',
                                //         style: TextStyle(
                                //             fontSize: 12,
                                //             fontWeight: FontWeight.bold,
                                //             color:
                                //                 Theme.of(context).primaryColor),
                                //         maxLines: 1,
                                //         overflow: TextOverflow.ellipsis,
                                //       ),
                                Text(
                                  (box.read('userType') == "wholesale")
                                      ? ' Rs. ${_data.wholesaler_price.toString()}'
                                      : 'Offer Rs. ${_data.price.toString()}',
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
                  ),
                ],
              ),
            ),
            Hero(
              tag: 'category$index',
              transitionOnUserGestures: true,
              child: ClipPath(
                clipper: ClipBackground(),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      image: DecorationImage(
                          image:
                              NetworkImage(BASE_URL + _data.image.toString()),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _itemFood(
    Map<String, dynamic> _offerZone, BuildContext context, int index) {
  return GestureDetector(
    onTap: () => Get.toNamed('/detailsPage', arguments: [
      {
        'index': index.toString(),
      }
    ]),
    child: Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 1)],
        borderRadius: BorderRadius.circular(10),
      ),
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                // borderRadius: const BorderRadius.only(
                //   topLeft: Radius.circular(10),
                //   bottomLeft: Radius.circular(10),
                // ),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    _offerZone['imgUrl'],
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          // Image.network(
          //   _offerZone['imgUrl'],
          //   height: 140,
          //   width: 150,
          //   fit: BoxFit.cover,
          // ),
          Expanded(
            child: Container(
              // color: Colors.amber,
              padding: const EdgeInsets.only(
                  bottom: 4.0, top: 8.0, left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              MdiIcons.squareCircle,
                              size: 18,
                              color: _offerZone['type'] == 'veg'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                _offerZone['title'],
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          _offerZone['subTitle'].toString(),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'from Rs. ${_offerZone['price'].toString()}',
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
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: const [
          //       Text(
          //         '25',
          //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          //         maxLines: 2,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //       Text(
          //         'mins',
          //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          //         maxLines: 2,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    ),
  );
}
