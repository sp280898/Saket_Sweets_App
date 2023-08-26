import 'package:flutter/material.dart';
import 'package:saket_sweets_app/core/style.dart';
import 'package:saket_sweets_app/widgets/all_restaurant.dart';
import 'package:saket_sweets_app/widgets/best_offer.dart';
import 'package:saket_sweets_app/widgets/item_restaurant.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/screens/home/controller/home_page_controller.dart';
import 'package:saket_sweets_app/widgets/banner.dart';
import 'package:saket_sweets_app/widgets/categoriesList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.isLoading.isTrue
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(child: CircularProgressIndicator()),
              )
            : RefreshIndicator(
                onRefresh: () => controller.getList(),
                child: SingleChildScrollView(
                  physics: const PageScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).padding.top,
                        color: Theme.of(context).primaryColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     _scaffoldKey.currentState?.openDrawer();
                          //   },
                          //   child: const Padding(
                          //     padding: EdgeInsets.only(left: 8.0),
                          //     child: Icon(
                          //       Icons.menu_outlined,
                          //       // size: 30,
                          //     ),
                          //   ),
                          // ),
                          const Text(''),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  MdiIcons.mapMarkerRadiusOutline,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print(controller.pincode);
                                    Get.toNamed('/addressPage')!.then((value) =>
                                        controller.getPrimaryAddress());
                                  },
                                  child: Obx(() {
                                    return Text(
                                      controller.pincode.isNotEmpty
                                          ? 'Delivering to -${controller.pincode}'
                                          : 'Add Address',
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: IconButton(
                                onPressed: () => Get.toNamed('/notification'),
                                icon: const Icon(
                                  Icons.notifications_outlined,
                                  // size: 30,
                                ),
                              ))
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => Get.toNamed('/searchPage'),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      // color: Colors.grey.shade600,
                                      color: active,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Search for Products, Brands & More',
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            bannerSlider(controller.banners, context),
                            categoriesList(controller.categories, context),
                            const SizedBox(
                              height: 15,
                            ),
                            bestOffer(
                                context,
                                controller.foodItemList,
                                controller.greetingStatus.value,
                                controller.greetingTime.value,
                                controller.greetingValue.value),
                            //adding ne comment
                            // itemRestaurant(
                            //     context, restaurantData, 'Popular Shop'),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // allRestaurant(context, allRestaurantData,
                            //     'All Shop', '200+ Near you')
                            // Obx(
                            //   () {
                            //     return bestOffer(
                            //       context,
                            //       offerZones,
                            //       controller.greetingStatus.value,
                            //       controller.greetingTime.value,
                            //     );
                            //   },
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
