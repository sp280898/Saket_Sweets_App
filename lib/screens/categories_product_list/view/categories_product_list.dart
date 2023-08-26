import 'package:flutter/material.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:saket_sweets_app/screens/categories_product_list/controller/categories_product_controller.dart';
import 'package:saket_sweets_app/services/http_service_impl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:saket_sweets_app/core/constent.dart';

class CategoriesProductList extends StatefulWidget {
  const CategoriesProductList({Key? key}) : super(key: key);

  @override
  _CategoriesProductListState createState() => _CategoriesProductListState();
}

class _CategoriesProductListState extends State<CategoriesProductList> {
  final controller = Get.find<CategoriesProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'categoryTop${controller.id}',
            child: Container(
              height: MediaQuery.of(context).size.height / 2.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(controller.img), fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
            color: Colors.black38,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.3,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          controller.title,
                          style: const TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Obx(() {
                  return controller.isLoading.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16),
                                child: Text(
                                  '${controller.categoryList.length} Products available',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              ListView.builder(
                                itemBuilder: (context, index) {
                                  return _itemProduct(
                                      index, controller.categoryList[index]);
                                },
                                itemCount: controller.categoryList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(0),
                              ),
                            ],
                          ));
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemProduct(int index, FoodItemDetails _data) {
    return GestureDetector(
      onTap: () => Get.toNamed('/detailsPage', arguments: [
        {
          'id': _data.id.toString(),
          'route': 'category',
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

class ClipBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0); // topLeft
    path.lineTo(0, size.height); // bottomLeft
    // path.moveTo(size.width * 0.7, size.height); //bottomRight
    path.lineTo(size.width * 0.7, size.height); //bottomRight
    // path.quadraticBezierTo(
    //     size.width * 0.8, 50, size.width * 0.8, size.height * 0.8);
    path.lineTo(size.width, 0); //topRight
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
