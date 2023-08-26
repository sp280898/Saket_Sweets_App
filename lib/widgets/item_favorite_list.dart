import 'package:flutter/material.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:saket_sweets_app/screens/favorite_list/controller/favourite_list_controller.dart';
import 'package:saket_sweets_app/services/http_service_impl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:widget_mask/widget_mask.dart';

class ItemFavoriteList extends StatefulWidget {
  final FoodItemDetails favItem;
  final int index;
  const ItemFavoriteList({required this.favItem, required this.index, Key? key})
      : super(key: key);

  @override
  State<ItemFavoriteList> createState() => _ItemFavoriteListState();
}

class _ItemFavoriteListState extends State<ItemFavoriteList> {
  final controller = Get.find<FavouriteListController>();
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/detailsPage', arguments: [
        {
          'index': widget.index.toString(),
          'route': 'fav',
          'id': widget.favItem.id.toString(),
        }
      ]),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 1)],
          borderRadius: BorderRadius.circular(10),
        ),
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'fav${widget.index}',
              child: WidgetMask(
                blendMode: BlendMode.srcATop,
                childSaveLayer: true,
                child: const Image(
                  image: AssetImage(
                    './assets/images/bg2.png',
                  ),
                  width: 150,
                  height: 150,
                ),
                mask: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          BASE_URL + widget.favItem.image!,
                        ),
                        fit: BoxFit.cover,
                      )),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.favorite,
                          size: 30,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Icon(
                              //   MdiIcons.squareCircle,
                              //   size: 18,
                              //   color: _offerZone['type'] == 'veg'
                              //       ? Colors.green
                              //       : Colors.red,
                              // ),
                              // const SizedBox(
                              //   width: 5,
                              // ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.favItem.name!,
                                      style: GoogleFonts.patuaOne(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    GestureDetector(
                                      onTap: () => controller.hitRemoveApi(
                                          widget.favItem.fav_id.toString()),
                                      child: const Icon(
                                        Icons.close,
                                        size: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.favItem.description!,
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
                            (box.read('userType') == "wholesale")
                                ? 'Rs. ${widget.favItem.wholesaler_price!}'
                                : 'Rs. ${widget.favItem.price!}',
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
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 4.0, left: 8.0),
                            child: OutlinedButton(
                                onPressed: () {
                                  if (controller.addressStutas == '201') {
                                    dialog();
                                  } else {
                                    var price =
                                        (box.read('userType') == "wholesale")
                                            ? widget.favItem.wholesaler_price
                                                .toString()
                                            : widget.favItem.price.toString();
                                    controller.addToCart(
                                        widget.favItem.id.toString(),
                                        price,
                                        "1");
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      size: 18,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'ADD',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  sdf() {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 1)],
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    BASE_URL + widget.favItem.image!,
                  ),
                  fit: BoxFit.cover,
                )),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: SizedBox(
                    width: 150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity--;
                                controller.price * quantity;
                                print(controller.price.toString());
                              }
                            });
                          },
                          child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.remove)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            quantity.toString(),
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantity > 0) {
                                quantity++;
                                controller.price * quantity;
                                print(controller.price.toString());
                              }
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
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
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.favItem.veg_nveg != null
                                ? Icon(
                                    MdiIcons.squareCircle,
                                    size: 14,
                                    color: widget.favItem.veg_nveg!
                                                .toLowerCase()
                                                .trim() ==
                                            'veg'
                                        ? Colors.green
                                        : Colors.red,
                                  )
                                : const SizedBox.shrink(),
                            widget.favItem.veg_nveg != null
                                ? const SizedBox(
                                    width: 5,
                                  )
                                : const SizedBox.shrink(),
                            Expanded(
                              child: Text(
                                widget.favItem.name!,
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
                          widget.favItem.ingredients.toString(),
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
                          '\u{20B9} ${int.parse(widget.favItem.price!) * quantity}',
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
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0, left: 8.0),
                          child: OutlinedButton(
                            onPressed: () {
                              var price =
                                  int.parse(widget.favItem.price!) * quantity;
                              print(
                                  'addressStutas in Page: ${controller.addressStutas}');
                              if (controller.addressStutas == '201') {
                                dialog();
                              } else {
                                controller.addToCart(
                                    widget.favItem.id.toString(),
                                    price.toString(),
                                    controller.quantity.value.toString());
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'ADD',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
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
      // cancel: ElevatedButton(
      //   onPressed: () {
      //     Get.back();
      //     count.value = 1;
      //     Get.offNamed('/askQuery');
      //   },
      //   style: ElevatedButton.styleFrom(
      //       primary: Colors.red,
      //       padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      //       textStyle:
      //           const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      //   child: const Text(
      //     'No',
      //     style: TextStyle(
      //         color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
      //   ),
      // ),
      // // onConfirm: () => print('yes'),
      // // onCancel: () => print('yes'),
      // cancelTextColor: Colors.black,
    );
  }
}
