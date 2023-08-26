import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:saket_sweets_app/core/style.dart';
import 'package:saket_sweets_app/screens/cart/view/cart_list.dart';
import 'package:saket_sweets_app/screens/deshboard/controller/dashboard_controller.dart';
import 'package:saket_sweets_app/screens/favorite_list/view/favorite_list.dart';
import 'package:saket_sweets_app/screens/home/view/homePage.dart';
import 'package:saket_sweets_app/screens/profile/view/profile.dart';
import 'package:saket_sweets_app/services/local_notification_service.dart';
import 'package:saket_sweets_app/widgets/custom_animated_bottom_bar.dart';
import 'package:get/get.dart';

class Deshboard extends StatefulWidget {
  const Deshboard({Key? key}) : super(key: key);

  @override
  _DeshboardState createState() => _DeshboardState();
}

class _DeshboardState extends State<Deshboard> {
  int _currentIndex = 0;
  final _inactiveColor = Colors.black;
  final _activeColor = active;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LocalNotificationService.initialize(context);

    //gives you the message on which user taps and it opened the app from
    // terminated state.
    FirebaseMessaging.instance.getInitialMessage();

    // this will only gets call when the app in the forground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print('delivery: ${message.data["delivery"]}');
        print('deliverystatus: ${message.data["deliverystatus"]}');
        print('type: ${message.data["type"]}');
      }
      LocalNotificationService.display(message);
    });

    // only work when the app is open and also in background,
    // and user taps on the notification.
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data['route'];
      print('$routeFromMessage');
      Get.toNamed('/' + routeFromMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeshboardController>(builder: (controller) {
      return Scaffold(
        // Old code where controller not working properly 19-03-2022
        // body: getBody(),
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            HomePage(),
            CartList(),
            FavoriteList(),
            const Profile(),
          ],
        ),
        bottomNavigationBar: CustomAnimatedBottomBar(
          // containerHeight: 60,
          backgroundColor: Colors.white,
          selectedIndex: controller.tabIndex,
          showElevation: false,
          itemCornerRadius: 15,
          curve: Curves.easeIn,
          onItemSelected: controller.changeTabIndex,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.apps_outlined),
              title: Text('Home'),
              // activeColor: Colors.green,
              activeColor: _activeColor,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              title: Text('Cart'),
              // activeColor: Colors.purpleAccent,
              activeColor: _activeColor,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              title: Text('Favorites'),
              // activeColor: Colors.blue,
              activeColor: _activeColor,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Account'),
              // activeColor: Colors.orange,
              activeColor: _activeColor,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }

  // Old code where controller not working properly 19-03-2022
  // Widget getBody() {
  //   List<Widget> pages = [
  //     const DeshboardPage(),
  //     const CartList(),
  //     const SubscriptionPlan(),
  //     const FavoriteList(),
  //     const Profile(),
  //   ];
  //   return IndexedStack(
  //     index: _currentIndex,
  //     children: pages,
  //   );
  // }

}
