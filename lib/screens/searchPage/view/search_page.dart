import 'package:flutter/material.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:saket_sweets_app/screens/searchPage/controller/search_controller.dart';
import 'package:saket_sweets_app/services/http_service_impl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/widgets/appBarWidget.dart';
import 'package:widget_mask/widget_mask.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = Get.find<SearchPageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Search'),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                onChanged: (value) => controller.hitApi(value),
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: "Search Food here",
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  border: InputBorder.none,
                  // focusedBorder: const OutlineInputBorder(
                  //   borderSide:
                  //       BorderSide(color: Colors.amber, width: 2.0),
                  // ),
                  // enabledBorder: const OutlineInputBorder(
                  //   borderSide:
                  //       BorderSide(color: Colors.black, width: 1.0),
                  // ),
                ),
                // controller: controller.mobileController,
                // onSaved: (value) {
                //   controller.phone = value!;
                // },
                //   validator: (value) {
                //     return controller.validatePhone(value!);
                //   },
              ),
            ),
            Obx(() {
              return controller.searchList.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        itemBuilder: (context, index) {
                          return _itemFood(index, controller.searchList[index]);
                        },
                        itemCount: controller.searchList.length,
                      ),
                    )
                  : const Expanded(
                      child: Center(
                        child: Text('No data found'),
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }

  Widget _itemFood(
    int index,
    FoodItemDetails _data,
  ) {
    return GestureDetector(
      onTap: () => Get.toNamed('/detailsPage', arguments: [
        {
          'id': _data.id.toString(),
          'route': 'search',
          'index': index.toString(),
        }
      ]),
      child: SizedBox(
        height: 120,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(left: 30),
              height: 100,
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
                        Text(
                          _data.name.toString(),
                          style: GoogleFonts.patuaOne(
                              fontSize: 14, fontWeight: FontWeight.bold),
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
                              fontSize: 12, fontWeight: FontWeight.w300),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Rs. ${_data.price.toString()}',
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
            Hero(
              tag: "search$index",
              child: WidgetMask(
                  blendMode: BlendMode.srcATop,
                  childSaveLayer: true,
                  mask: Image(
                    image: NetworkImage(
                      BASE_URL + _data.image.toString(),
                    ),
                    fit: BoxFit.fill,
                  ),
                  child: const Image(
                    image: NetworkImage(
                      'https://raw.githubusercontent.com/Hummer97/image/master/asdasdad1.png',
                    ),
                    height: 120,
                    width: 120,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
