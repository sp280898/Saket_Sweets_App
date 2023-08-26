import 'package:flutter/material.dart';
import 'package:saket_sweets_app/core/model/menu_popup_response.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:saket_sweets_app/screens/address_list/controller/address_list_controller.dart';
import 'package:saket_sweets_app/widgets/popup_modelsheet.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/widgets/appBarWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum clickType { first, second, third }

class AddressList extends StatefulWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  final controller = Get.find<AddressListController>();
  final GlobalKey _menuKey = GlobalKey();

  List<String> menu = [
    'Make address primary',
    'Edit',
    'Delete',
  ];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   controller.hitApi(box.read('id').toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBarWidget('All Addresses'),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : controller.addressList.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _itemAddress(
                          controller.addressList[index], context);
                    },
                    itemCount: controller.addressList.length,
                  )
                : const Center(
                    child: Text('Empty List'),
                  );
      }),
      floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Get.offNamed('/addAddress');
          }),
    );
  }

  Widget _itemAddress(AddressDetails address, BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          // image: const DecorationImage(
          //     // opacity: 0.2,
          //     image: AssetImage('assets/images/bg.jpg'),
          //     fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 32,
              height: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.white,
                image: const DecorationImage(
                    // opacity: 0.6,
                    image: AssetImage('assets/images/bg.jpg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  address.primary_type.toString() == '1'
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                MdiIcons.checkboxBlankCircle,
                                size: 8,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Primary Address',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        address.name.toString(),
                        style: GoogleFonts.patuaOne(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () => _showPopUp(
                          context: context,
                          title: 'Menu Options',
                          data: menu,
                          fieldAddress: 'route',
                          id: address.id.toString(),
                        ),
                        child: const Icon(
                          Icons.more_vert,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    address.mobile.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Divider(
                    height: 15,
                  ),
                  Text(
                    address.address.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Pincode - ${address.pin_code}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPopUp(
      {required BuildContext context,
      required String title,
      required List<String> data,
      required String fieldAddress,
      required String id}) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
              onTap: () {
                // dialog();
              },
              behavior: HitTestBehavior.opaque,
              child: PopupModelSheet(
                title: title,
                data: data,
                response: _getResponse,
                fieldAddress: fieldAddress,
                fieldID: id,
              ));
        });
  }

  void _getResponse(String response, String fieldAddress, String fieldID) {
    final newResponse = MenuPopUpResponse(
        response: response, address: fieldAddress, addressID: fieldID);
    print("response back: ${newResponse.response}");

    if (newResponse.address.toString() == "route") {
      controller.relation.value = newResponse.response;
      // Get.back();
      print("open Dilog sd:");
      dialog(newResponse.response, fieldID);
    }
    controller.response.value = newResponse.response;
  }

  dialog(String name, String addressID) {
    print("close Dilog sd:");
    Get.defaultDialog(
      title: name == 'Make address primary'
          ? 'Are you sure do you want to make this address primary address ?'
          : 'Are you sure do you want to $name this address',
      titleStyle: const TextStyle(fontWeight: FontWeight.w600),
      titlePadding: const EdgeInsets.only(top: 20, left: 12, right: 12),
      content: const SizedBox(
        height: 2,
      ),
      radius: 10.0,
      barrierDismissible: false,
      confirm: ElevatedButton(
        onPressed: () {
          if (name == 'Make address primary') {
            controller.setPrimaryAddress(addressID, box.read('id').toString());
            Get.back();
          } else if (name == 'Edit') {
            print('Edit');
            Get.back();
            Get.offNamed('/editAddress', arguments: [
              {'id': addressID}
            ]);
          } else if (name == 'Delete') {
            print(addressID);
            controller.hitAddressDeleteApi(
                box.read('id').toString(), addressID);
            Get.back();
          } else {
            Get.back();
          }
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.teal,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        child: const Text(
          'Yes',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
          // Get.toNamed('/chat');
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        child: const Text(
          'No',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
      // onConfirm: () => print('yes'),
      // onCancel: () => print('yes'),
      cancelTextColor: Colors.black,
    );
  }
}
