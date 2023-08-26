import 'package:flutter/material.dart';
import 'package:saket_sweets_app/screens/favorite_list/controller/favourite_list_controller.dart';
import 'package:saket_sweets_app/widgets/item_favorite_list.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saket_sweets_app/widgets/appBarWidget.dart';
import 'package:widget_mask/widget_mask.dart';

class FavoriteList extends GetView<FavouriteListController> {
  FavoriteList({Key? key}) : super(key: key) {
    controller.hitApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Favorite List'),
      body: Obx(() {
        return controller.favouriteList.isNotEmpty
            ? RefreshIndicator(
                onRefresh: () async {
                  controller.hitApi();
                },
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ItemFavoriteList(
                            favItem: controller.favouriteList[index],
                            index: index,
                          );
                          //old code where the increment and dicrement not working
                          // return _itemFavorite(
                          //     controller.favouriteList[index], context, index);
                        },
                        itemCount: controller.favouriteList.length,
                      ),
                    ),
                  ],
                ),
              )
            : const Center(
                child: Text('Empty List'),
              );
      }),
    );
  }

  Widget _itemFavorite(
      Map<dynamic, dynamic> _offerZone, BuildContext ctx, int index) {
    return GestureDetector(
      onTap: () => Get.toNamed('/detailsPage', arguments: [
        {
          'index': index.toString(),
          'route': 'fav',
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
              tag: 'fav$index',
              child: WidgetMask(
                blendMode: BlendMode.srcATop,
                childSaveLayer: true,
                child: const Image(
                  image: NetworkImage(
                    'https://raw.githubusercontent.com/Hummer97/image/master/asdasdad4.png',
                  ),
                  width: 150,
                  height: 150,
                ),
                mask: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          _offerZone['imgUrl'],
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
                                child: Text(
                                  _offerZone['title'],
                                  style: GoogleFonts.patuaOne(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
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
                            style: TextStyle(
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
                                color: Theme.of(ctx).primaryColor),
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
                                onPressed: () => print('object'),
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
}
