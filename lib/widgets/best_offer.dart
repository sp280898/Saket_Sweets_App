import 'package:flutter/material.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:saket_sweets_app/services/http_service_impl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bestOffer(
  BuildContext ctx,
  List<FoodItemDetails> foodItemList,
  String mainTitle,
  String subtitle,
  String greatingValue,
) {
  return Container(
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(ctx).size.width,
          padding: EdgeInsets.only(top: 8, bottom: 0, right: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Best Item',
                    style: GoogleFonts.patuaOne(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Most favourite items',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        // color: Theme.of(ctx).primaryColor,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Get.toNamed('/foodList'),
                child: Text(
                  'View All',
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(ctx).primaryColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          // color: Colors.blue,
          width: MediaQuery.of(ctx).size.width,
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return _itemBestOffer(foodItemList[i], ctx, i, greatingValue);
            },
            itemCount: foodItemList.length,
          ),
        )
      ],
    ),
  );
}

Widget _itemBestOffer(FoodItemDetails foodItemDetails, BuildContext ctx,
    int index, String greatingValue) {
  return GestureDetector(
    onTap: () => Get.toNamed('/detailsPage', arguments: [
      {
        'id': foodItemDetails.id.toString(),
        'route': 'bestItem',
        'index': index.toString(),
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
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: "bestItem$index",
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
                  (box.read('userType') == "wholesale")
                      ? '\u{20B9} ${foodItemDetails.wholesaler_price}'
                      : '\u{20B9} ${foodItemDetails.price}',
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
        ],
      ),
    ),
  );
}
