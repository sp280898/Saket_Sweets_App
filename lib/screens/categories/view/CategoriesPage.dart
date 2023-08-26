import 'package:flutter/material.dart';
import 'package:saket_sweets_app/models/categoryDetails.dart';
import 'package:saket_sweets_app/screens/categories/controller/categoriesPageController.dart';
import 'package:saket_sweets_app/services/http_service_impl.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/widgets/appBarWidget.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final controller = Get.find<CategoriesPageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget('All Category'),
        body: Obx(() {
          return controller.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(
                    controller.categories.length,
                    (index) {
                      return Center(
                        child: itemCard(controller.categories[index], context),
                      );
                    },
                  ),
                );
        }));
  }
}

Widget itemCard(CategoryDetails category, BuildContext context) {
  return GestureDetector(
    onTap: () => Get.toNamed('/categoriesProductList', arguments: [
      {
        'img': BASE_URL + category.image!,
        'title': category.name.toString(),
        'id': category.id.toString(),
      }
    ]),
    child: Card(
        child: Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(3),
                        topRight: Radius.circular(3)),
                    image: DecorationImage(
                      image: NetworkImage(
                        BASE_URL + category.image!,
                      ),
                      fit: BoxFit.cover,
                    )),
                // child: Image.network(
                //   categorie['imgUrl'],
                //   width: MediaQuery.of(context).size.width,
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(category.name.toString(),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 4,
            ),
          ]),
    )),
  );
}
