import 'package:flutter/material.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/models/foodItemDetails.dart';
import 'package:saket_sweets_app/screens/product_details/controller/product_details_controller.dart';
import 'package:saket_sweets_app/services/http_service_impl.dart';
import 'package:get/get.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool flag = false;
  final controller = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.size.isTrue
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: "${controller.route}${controller.index}",
                          child: Container(
                            height: 350,
                            // color: Colors.amber,
                            decoration: BoxDecoration(
                                image:
                                    (controller.foodItemDetails.image == null)
                                        ? const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/no_img.png"),
                                            fit: BoxFit.cover,
                                          )
                                        : DecorationImage(
                                            image: NetworkImage(BASE_URL +
                                                controller.foodItemDetails.image
                                                    .toString()),
                                            fit: BoxFit.cover,
                                          )),
                            child: Stack(
                              children: [
                                Container(
                                  color: Colors.black.withOpacity(0.3),
                                ),
                                Positioned(
                                  left: 30,
                                  top: MediaQuery.of(context).padding.top + 15,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Navigator.of(context).pop();
                                      Get.back();
                                    },
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 32,
                                  bottom: 26,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (!flag) {
                                        setState(() {
                                          flag = true;
                                          controller.addFavroute();
                                        });
                                      } else {
                                        setState(() {
                                          flag = false;
                                        });
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: (flag == false)
                                          ? const Icon(
                                              Icons.favorite,
                                              color: Colors.grey,
                                            )
                                          : const Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, right: 20, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.foodItemDetails.name
                                          .toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // Padding(
                                    //   padding:
                                    //       EdgeInsets.only(left: 2.0, top: 5.0),
                                    //   child: Text(
                                    //     controller.foodItemDetails.ingredients
                                    //         .toString(),
                                    //     style: const TextStyle(
                                    //       fontSize: 12,
                                    //       fontWeight: FontWeight.normal,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (controller.quantity > 1) {
                                        controller.quantity--;
                                        controller.price *
                                            controller.quantity.value;
                                        print(controller.price.toString());
                                      }
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      controller.quantity.toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (controller.quantity > 0) {
                                        controller.quantity++;
                                        controller.price *
                                            controller.quantity.value;
                                        print(controller.price.toString());
                                      }
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
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          // padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.foodItemDetails.description != null
                                  ? const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(
                                        'Discription',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              const SizedBox(
                                height: 10,
                              ),
                              controller.foodItemDetails.description != null
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(
                                        controller.foodItemDetails.description
                                            .toString(),
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ))
                                  : const SizedBox.shrink(),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(() {
                                      return Text(
                                        (box.read('userType') == "wholesale")
                                            ? '\u{20B9} ${int.parse(controller.foodItemDetails.wholesaler_price!) * controller.quantity.value}'
                                            : '\u{20B9} ${int.parse(controller.foodItemDetails.price!) * controller.quantity.value}',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      );
                                    }),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.addSubItem
                                            .add(controller.id);
                                        print(controller.addSubItem);
                                        var price = controller.price *
                                            controller.quantity.value;
                                        if (controller.addressStutas == '201') {
                                          dialog();
                                        } else {
                                          controller.addToCart(
                                              price.toString(),
                                              controller.quantity.value
                                                  .toString());
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 20),
                                        // margin: const EdgeInsets.symmetric(
                                        //     horizontal: 20),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                Theme.of(context).primaryColor),
                                        child: const Text(
                                          'Add to cart',
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
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );

        // SizedBox(
        //     width: double.infinity,
        //     child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           const Text('Somthing went wrong'),
        //           ElevatedButton(
        //               onPressed: () => controller.hitApi(),
        //               child: const Text('Retry'))
        //         ]),
        //   );
      }),
    );
  }

  Widget _itemBestOffer(FoodItemDetails foodItemDetails) {
    return GestureDetector(
      onTap: () {
        controller.id = foodItemDetails.id.toString();
        controller.hitApi();
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 1)],
          borderRadius: BorderRadius.circular(10),
        ),
        height: 150,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        BASE_URL + foodItemDetails.image!,
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            // Image.network(
            //   _offerZone['imgUrl'],
            //   height: 140,
            //   width: 150,
            //   fit: BoxFit.cover,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    foodItemDetails.name.toString(),
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    foodItemDetails.ingredients.toString(),
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w300),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\u{20B9} ${foodItemDetails.price}',
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
          Get.offNamed('/addressPage');
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
