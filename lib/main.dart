import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:saket_sweets_app/core/style.dart';
import 'package:saket_sweets_app/screens/address_list/binding/add_address_binding.dart';
import 'package:saket_sweets_app/screens/address_list/binding/address_list_binding.dart';
import 'package:saket_sweets_app/screens/address_list/binding/edit_address_binding.dart';
import 'package:saket_sweets_app/screens/address_list/view/add_address.dart';
import 'package:saket_sweets_app/screens/address_list/view/edit_address.dart';
import 'package:saket_sweets_app/screens/cart/binding/cart_list_binding.dart';
import 'package:saket_sweets_app/screens/categories/binding/categoriesPageBinding.dart';
import 'package:saket_sweets_app/screens/categories_product_list/binding/categories_product_binding.dart';
import 'package:saket_sweets_app/screens/deshboard/binding/dashboard_binding.dart';
import 'package:saket_sweets_app/screens/deshboard/deshboard.dart';
import 'package:saket_sweets_app/screens/favorite_list/binding/favourite_list_binding.dart';
import 'package:saket_sweets_app/screens/food_list/binding/food_list_binding.dart';
import 'package:saket_sweets_app/screens/orders/binding/my_order_binding.dart';
import 'package:saket_sweets_app/screens/product_details/binding/product_details_binding.dart';
import 'package:saket_sweets_app/screens/profile/binding/edit_profile_binding.dart';
import 'package:saket_sweets_app/screens/profile/binding/profile_binding.dart';
import 'package:saket_sweets_app/screens/profile/view/edit_profile.dart';
import 'package:saket_sweets_app/screens/profile/view/profile.dart';
import 'package:saket_sweets_app/screens/searchPage/binding/search_binding.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/screens/address_list/view/address_list.dart';
import 'package:saket_sweets_app/screens/auth/binding/otp_binding.dart';
import 'package:saket_sweets_app/screens/auth/binding/signin_binding.dart';
import 'package:saket_sweets_app/screens/auth/view/ForgetPasswordPage.dart';
import 'package:saket_sweets_app/screens/auth/view/otp_page.dart';
import 'package:saket_sweets_app/screens/auth/view/signin.dart';
import 'package:saket_sweets_app/screens/auth/view/signup.dart';
import 'package:saket_sweets_app/screens/cart/view/cart_list.dart';
import 'package:saket_sweets_app/screens/categories/view/CategoriesPage.dart';
import 'package:saket_sweets_app/screens/categories_product_list/view/categories_product_list.dart';
import 'package:saket_sweets_app/screens/favorite_list/view/favorite_list.dart';
import 'package:saket_sweets_app/screens/food_list/view/food_list.dart';
import 'package:saket_sweets_app/screens/home/binding/home_page_binding.dart';
import 'package:saket_sweets_app/screens/home/view/homePage.dart';
import 'package:saket_sweets_app/screens/menu_list/view/menu_list.dart';
import 'package:saket_sweets_app/screens/orders/view/my_orders.dart';
import 'package:saket_sweets_app/screens/product_details/view/product_details.dart';
import 'package:saket_sweets_app/screens/searchPage/view/search_page.dart';
import 'package:saket_sweets_app/screens/slpeash_screen/splash_screen.dart';
import 'package:saket_sweets_app/screens/subscription_plan/view/subscription_plan.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/invoice/binding/invoice_binding.dart';
import 'screens/invoice/view/invoice.dart';
import 'screens/payment_getway/binding/payment_getway_binding.dart';
import 'screens/payment_getway/view/payment_getway.dart';

//Recive message when app is on background solution for on messgage
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  );
  await GetStorage.init();
// Pass all uncaught errors from the framework to Crashlytics.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      transitionDuration: const Duration(milliseconds: 500),
      theme: ThemeData(
          // primarySwatch: Colors.red,
          primaryColor: active,
          indicatorColor: secondColor,
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: secondColor,
          ),
          appBarTheme: AppBarTheme(
            shadowColor: transparent,
            backgroundColor: active,
            elevation: 0,
          )),
      getPages: [
        GetPage(
          name: '/dashboard',
          page: () => const Deshboard(),
          binding: DeshboardBinding(),
        ),
        GetPage(
          name: '/homePage',
          page: () => const HomePage(),
          binding: HomePageBinding(),
        ),
        GetPage(
          name: '/splash_screen',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/signIn',
          page: () => const SignIn(),
          binding: SigninBinding(),
        ),
        GetPage(
          name: '/signUp',
          page: () => const SignUp(),
        ),
        GetPage(
          name: '/otpVerify',
          page: () => const OtpPage(),
          binding: OtpBinding(),
        ),
        GetPage(
          name: '/resetPass',
          page: () => const ForgetPasswordPage(),
        ),
        GetPage(
          name: '/splash_screen',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/orderPage',
          page: () => const MyOrders(),
        ),
        GetPage(
          name: '/favoritePage',
          page: () => FavoriteList(),
          binding: FavouriteListBinding(),
        ),
        GetPage(
          name: '/myOrderPage',
          page: () => const MyOrders(),
          binding: MyOrderBinding(),
        ),
        GetPage(
          name: '/cartPage',
          page: () => CartList(),
          binding: CartListBinding(),
        ),
        GetPage(
          name: '/categoryPage',
          page: () => const CategoriesPage(),
          binding: CategoriesPageBinding(),
        ),
        GetPage(
          name: '/allOffers',
          page: () => const MenuList(),
        ),
        GetPage(
          name: '/addAddress',
          page: () => const AddAddress(),
          binding: AddAddressBinding(),
        ),
        GetPage(
          name: '/addressPage',
          page: () => const AddressList(),
          binding: AddressListBinding(),
        ),
        GetPage(
          name: '/editAddress',
          page: () => const EditAddress(),
          binding: EditAddressBinding(),
        ),
        GetPage(
          name: '/editProfile',
          page: () => const EditProfile(),
          binding: EditProfileBinding(),
        ),
        GetPage(
          name: '/profile',
          page: () => const Profile(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: '/subscriptionPlan',
          page: () => const SubscriptionPlan(),
        ),
        GetPage(
            name: '/categoriesProductList',
            page: () => const CategoriesProductList(),
            binding: CategoriesProductBinding()),
        GetPage(
          name: '/foodList',
          page: () => const FoodList(),
          binding: FoodListBinding(),
        ),
        GetPage(
          name: '/searchPage',
          page: () => const SearchPage(),
          binding: SearchPageBinding(),
        ),
        GetPage(
          name: '/detailsPage',
          page: () => const ProductDetails(),
          binding: ProductDetailsbinding(),
        ),
        GetPage(
          name: '/paymetGetway',
          page: () => const PaymentGetway(),
          binding: PaymentGetwayBinding(),
        ),
        GetPage(
          name: '/invoice',
          page: () => Invoice(),
          binding: InvoiceBinding(),
        ),
      ],
      initialRoute: '/splash_screen',
    );
  }
}
