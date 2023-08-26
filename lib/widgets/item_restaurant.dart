import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget itemRestaurant(
  BuildContext ctx,
  List<Map<dynamic, dynamic>> offerZone,
  String mainTitle,
) {
  return GestureDetector(
    // onTap: () {
    //   Navigator.push(
    //     ctx,
    //     MaterialPageRoute(
    //       builder: (ctx) => callBack,
    //     ),
    //   );
    // },
    child: Container(
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
                      mainTitle,
                      style: GoogleFonts.patuaOne(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Text(
                    //   subtitle,
                    //   style: TextStyle(
                    //       fontSize: 13,
                    //       color: Colors.grey[600],
                    //       // color: Theme.of(ctx).primaryColor,
                    //       fontWeight: FontWeight.w300),
                    // ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.toNamed('/allOffers'),
                  child: Text(
                    'View All',
                    style: TextStyle(
                        fontSize: 14, color: Theme.of(ctx).primaryColor),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            // color: Colors.blue,
            width: MediaQuery.of(ctx).size.width,
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return _itemitemRestaurant(offerZone[i], ctx, i);
              },
              itemCount: offerZone.length,
            ),
          )
        ],
      ),
    ),
  );
}

Widget _itemitemRestaurant(
    Map<dynamic, dynamic> _offerZone, BuildContext ctx, int index) {
  return GestureDetector(
    // onTap: () => Get.toNamed('/detailsPage', arguments: [
    //   {
    //     'index': index.toString(),
    //     'route': 'home',
    //   }
    // ]),
    child: Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 1)],
        borderRadius: BorderRadius.circular(10),
      ),
      height: 120,
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: 'home$index',
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        _offerZone['imgUrl'],
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
                  _offerZone['title'],
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  _offerZone['subTitle'].toString(),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                // Text(
                //   'from Rs. ${_offerZone['price'].toString()}',
                //   style: TextStyle(
                //       fontSize: 12,
                //       fontWeight: FontWeight.bold,
                //       color: Theme.of(ctx).primaryColor),
                //   maxLines: 1,
                //   overflow: TextOverflow.ellipsis,
                // ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 16,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '(25)',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
