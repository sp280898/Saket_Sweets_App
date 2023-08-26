import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/models/foodItemDetails.dart';
import 'package:saket_sweets_app/screens/cart/controller/cart_list_controller.dart';
import 'package:saket_sweets_app/services/http_service_impl.dart';
import 'package:widget_mask/widget_mask.dart';

class ItemCart extends StatefulWidget {
  final FoodItemDetails cartItem;
  final int index;
  const ItemCart({required this.cartItem, required this.index, Key? key})
      : super(key: key);

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  final controller = Get.find<CartListController>();
  @override
  Widget build(BuildContext context) {
    var quantity = int.parse(widget.cartItem.quantity!);
    return SizedBox(
      height: 125,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(left: 30),
            height: 105,
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Row(
              children: [
                const SizedBox(
                  width: 128 - 50,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.cartItem.name!,
                            style: GoogleFonts.patuaOne(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          GestureDetector(
                            onTap: () => controller.hitRemoveApi(
                                widget.cartItem.cart_id.toString()),
                            child: const Icon(
                              Icons.close,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        widget.cartItem.description!,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Quantity: ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            widget.cartItem.quantity.toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        (box.read('userType') == "wholesale")
                            ? 'Rs. ${widget.cartItem.wholesaler_price.toString()}'
                            : 'Rs. ${widget.cartItem.price.toString()}',
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
          WidgetMask(
              blendMode: BlendMode.srcATop,
              childSaveLayer: true,
              mask: Container(
                width: 120,
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        BASE_URL + widget.cartItem.image!,
                      ),
                      fit: BoxFit.cover,
                    )),
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        // color: Colors.red,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;
                                  int itemTotalPrice =
                                      (box.read('userType') == "wholesale")
                                          ? (int.parse(widget
                                                  .cartItem.wholesaler_price!) *
                                              quantity)
                                          : (int.parse(widget.cartItem.price!) *
                                              quantity);
                                  controller.hitEditApi(
                                      widget.cartItem.cart_id.toString(),
                                      quantity.toString(),
                                      itemTotalPrice.toString());
                                  // controller.price * quantity;
                                  // print(controller.price.toString());
                                }
                              });
                            },
                            child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300]!.withOpacity(0.7),
                                  // shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Icon(Icons.remove)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                            ),
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
                                  int itemTotalPrice =
                                      (box.read('userType') == "wholesale")
                                          ? (int.parse(widget
                                                  .cartItem.wholesaler_price!) *
                                              quantity)
                                          : (int.parse(widget.cartItem.price!) *
                                              quantity);
                                  controller.hitEditApi(
                                      widget.cartItem.cart_id.toString(),
                                      quantity.toString(),
                                      itemTotalPrice.toString());
                                  // controller.price * quantity;
                                  // print(controller.price.toString());
                                }
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.grey[300]!.withOpacity(0.7),
                                // shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              child: const Image(
                image: AssetImage(
                  './assets/images/bg2.png',
                ),
                height: 120,
                width: 120,
              )),
        ],
      ),
    );
    ;
  }

  dffd() {
    var quantity = int.parse(widget.cartItem.quantity!);
    return Container(
      margin: const EdgeInsets.all(5),
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
            width: 120,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    BASE_URL + widget.cartItem.image!,
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
                Positioned(
                  bottom: 10,
                  child: SizedBox(
                    width: 120,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity--;
                                int itemTotalPrice = (box
                                            .read('userType') ==
                                        "wholesale")
                                    ? (int.parse(
                                            widget.cartItem.wholesaler_price!) *
                                        quantity)
                                    : (int.parse(widget.cartItem.price!) *
                                        quantity);
                                controller.hitEditApi(
                                    widget.cartItem.cart_id.toString(),
                                    quantity.toString(),
                                    itemTotalPrice.toString());
                                // controller.price * quantity;
                                // print(controller.price.toString());
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
                                int itemTotalPrice = (box
                                            .read('userType') ==
                                        "wholesale")
                                    ? (int.parse(
                                            widget.cartItem.wholesaler_price!) *
                                        quantity)
                                    : (int.parse(widget.cartItem.price!) *
                                        quantity);
                                controller.hitEditApi(
                                    widget.cartItem.cart_id.toString(),
                                    quantity.toString(),
                                    itemTotalPrice.toString());
                                // controller.price * quantity;
                                // print(controller.price.toString());
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.cartItem.veg_nveg != null
                                ? Icon(
                                    MdiIcons.squareCircle,
                                    size: 14,
                                    color: widget.cartItem.veg_nveg!
                                                .toLowerCase()
                                                .trim() ==
                                            'veg'
                                        ? Colors.green
                                        : Colors.red,
                                  )
                                : const SizedBox.shrink(),
                            widget.cartItem.veg_nveg != null
                                ? const SizedBox(
                                    width: 5,
                                  )
                                : const SizedBox.shrink(),
                            Expanded(
                              child: Text(
                                widget.cartItem.name!,
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
                          widget.cartItem.ingredients.toString(),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Quantity: ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget.cartItem.quantity.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\u{20B9} ${widget.cartItem.total_price}',
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
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(right: 4.0, left: 8.0),
                  //         child: OutlineButton(
                  //             onPressed: () => print('object'),
                  //             borderSide: const BorderSide(
                  //               color: Colors.green,
                  //             ),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               children: const [
                  //                 Icon(
                  //                   Icons.add,
                  //                   size: 18,
                  //                   color: Colors.green,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 4,
                  //                 ),
                  //                 Text(
                  //                   'ADD',
                  //                   style: TextStyle(
                  //                       color: Colors.green,
                  //                       fontWeight: FontWeight.bold),
                  //                 ),
                  //               ],
                  //             )),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => controller.hitCartRemoveItem(
                  widget.cartItem.cart_id.toString(),
                  box.read('id').toString()),
              child: const Icon(Icons.close),
            ),
          )
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
    );
  }
}
