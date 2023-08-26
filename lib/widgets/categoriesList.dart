import 'package:flutter/material.dart';
import 'package:saket_sweets_app/models/categoryDetails.dart';
import 'package:saket_sweets_app/services/http_service_impl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget categoriesList(List<CategoryDetails> categories, BuildContext ctx) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories',
                style: GoogleFonts.patuaOne(
                    fontSize: 24, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () => Get.toNamed('/categoryPage'),
              child: Text(
                'View All',
                style:
                    TextStyle(fontSize: 14, color: Theme.of(ctx).primaryColor),
              ),
            ),
          ],
        ),
      ),
      Container(
          // color: Colors.red,
          height: 90,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return categoryListItem(index, categories[index]);
            },
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
          )),
    ],
  );
}

Widget categoryListItem(int index, CategoryDetails category) {
  return GestureDetector(
    onTap: () => Get.toNamed('/categoriesProductList', arguments: [
      {
        'img': BASE_URL + category.image!,
        'title': category.name.toString(),
        'id': category.id.toString(),
      }
    ]),
    child: Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      // decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: 'categoryTop${category.id.toString()}',
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(BASE_URL + category.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: Text(
              category.name!,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    ),
  );
}
