import 'dart:io';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:saket_sweets_app/services/http_service.dart';
import 'package:saket_sweets_app/services/http_service_impl.dart';
import 'package:get/get.dart';

class RepoImpl implements Repo {
  late HttpService _httpService;
  RepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<CategoriesData?> getCategoryList() async {
    try {
      final response = await _httpService.getCategoryList('api/category');
      final parsedResponse = CategoriesData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<FoodItemData?> getFoodList() async {
    try {
      final response = await _httpService.getFoodList('api/food-item');
      final parsedResponse = FoodItemData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<HomeData?> getHomePageList(String userID) async {
    try {
      final response = await _httpService.getHomePageList('api/home', userID);
      final parsedResponse = HomeData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<PlanData?> getPlanList() async {
    try {
      final response = await _httpService.getPlanList('api/plan');
      final parsedResponse = PlanData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<UserData?> hitEditProfileApi(
      String id, String name, String email, String address, File image) async {
    try {
      final response = await _httpService.hitEditProfileApi(
          'api/edit-profile', id, name, email, address, image);
      final parsedResponse = UserData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<UserData?> hitLoginApi(String mobile, String firebaseID,
      String deviceToken, String userType) async {
    try {
      final response = await _httpService.hitLoginApi(
          'api/login-detail-store', mobile, firebaseID, deviceToken, userType);
      final parsedResponse = UserData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<AddCartData?> hitAddCartApi(
      String userID, String foodID, String quantity, String price) async {
    try {
      final response = await _httpService.hitAddCartApi(
          'api/add-cart', userID, foodID, quantity, price);
      final parsedResponse = AddCartData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<AddFavouriteData?> hitAddFavouriteApi(
      String userID, String foodID) async {
    try {
      final response = await _httpService.hitAddFavouriteApi(
          'api/add-favorite', userID, foodID);
      final parsedResponse = AddFavouriteData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<CartData?> hitCartList(String userID) async {
    try {
      final response = await _httpService.hitCartList('api/cartlist', userID);
      final parsedResponse = CartData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<FavouriteListData?> hitFavouriteList(String userID) async {
    try {
      final response =
          await _httpService.hitFavouriteList('api/favoritelist', userID);
      final parsedResponse = FavouriteListData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<ShortFoodData?> hitShortCategoryApi(String category) async {
    try {
      final response = await _httpService.hitShortCategoryApi(
          'api/category-food-item', category);
      final parsedResponse = ShortFoodData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<AddressData?> getAddressList(String userID) async {
    try {
      final response =
          await _httpService.getAddressList('api/addresslist', userID);
      final parsedResponse = AddressData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<SubscriptionData?> getCancelSubscriptionList(String userID) async {
    try {
      final response = await _httpService.getCancelSubscriptionList(
          'api/cancelsubscribtionlist', userID);
      final parsedResponse = SubscriptionData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<SubscriptionData?> getSubscriptionList(String userID) async {
    try {
      final response = await _httpService.getCancelSubscriptionList(
          'api/subscribtion-list', userID);
      final parsedResponse = SubscriptionData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<AddressData?> hitAddAddressApi(
      String userID,
      String name,
      String phone,
      String address,
      String pinCode,
      String contry,
      String state,
      String city) async {
    try {
      final response = await _httpService.hitAddAddressApi('api/add-address',
          userID, name, phone, address, pinCode, contry, state, city);
      final parsedResponse = AddressData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<SubscriptionData?> hitCancelSubscriptionApi(String id, String isActive,
      String dateTimeCancle, String actualDateTimeEnd, String userID) async {
    try {
      final response = await _httpService.hitCancelSubscriptionApi(
          'api/cancelsubscribtion',
          id,
          isActive,
          dateTimeCancle,
          actualDateTimeEnd,
          userID);
      final parsedResponse = SubscriptionData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<AddressData?> hitDeleteAddressApi(String id, String userID) async {
    try {
      final response = await _httpService.hitDeleteAddressApi(
          'api/delete-address', id, userID);
      final parsedResponse = AddressData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<AddressData?> hitEditAddressApi(
      String id,
      String name,
      String phone,
      String address,
      String pinCode,
      String contry,
      String state,
      String city) async {
    try {
      final response = await _httpService.hitEditAddressApi('api/edit-address',
          id, name, phone, address, pinCode, contry, state, city);
      final parsedResponse = AddressData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<OrderData?> hitOrderApi(
    String userID,
    String foodID,
    String orderDateTime,
    String estimateDelivaryTime,
    String status,
    String deliveryAddress,
    String discount,
    String finalPrice,
    String comment,
    String paymentType,
    String paymentID,
    String address,
    String state,
    String pinCode,
  ) async {
    try {
      final response = await _httpService.hitOrderApi(
        'api/order',
        userID,
        foodID,
        orderDateTime,
        estimateDelivaryTime,
        status,
        deliveryAddress,
        discount,
        finalPrice,
        comment,
        paymentType,
        paymentID,
        address,
        state,
        pinCode,
      );
      final parsedResponse = OrderData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<SubscriptionData?> hitSubscriptionApi(
    String userID,
    String foodID,
    String planID,
    String dateTimeStart,
    String dateTimeEnd,
    String isPaidFull,
    String isActive,
    String dateTimeCancle,
    String actualDateTimeEnd,
    String paymentType,
    String paymentID,
  ) async {
    try {
      final response = await _httpService.hitSubscriptionApi(
          'api/subscribtion',
          userID,
          foodID,
          planID,
          dateTimeStart,
          dateTimeEnd,
          isPaidFull,
          isActive,
          dateTimeCancle,
          actualDateTimeEnd,
          paymentType,
          paymentID);
      final parsedResponse = SubscriptionData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<SingleAddressData?> getAddressDetails(String id) async {
    try {
      final response =
          await _httpService.getAddressDetails('api/address-detail', id);
      final parsedResponse = SingleAddressData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<SingleFoodData?> getFoodDetails(String id, String userID) async {
    try {
      final response =
          await _httpService.getFoodDetails('api/food-detail', id, userID);
      final parsedResponse = SingleFoodData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<MyOrderItemData?> getMyOrderList(String userID) async {
    try {
      final response =
          await _httpService.getMyOrderList('api/order-item', userID);
      final parsedResponse = MyOrderItemData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<AddressData?> hitSetPrimaryAddress(
      String id, String userID, String primaryType) async {
    try {
      final response = await _httpService.hitSetPrimaryAddress(
          'api/primary-address', id, userID, primaryType);
      final parsedResponse = AddressData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<SearchData?> getSearchResult(String search) async {
    try {
      final response =
          await _httpService.getSearchResult('api/search-food', search);
      final parsedResponse = SearchData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<CartData?> hitRemoveCartItem(String cartID, String userID) async {
    try {
      final response = await _httpService.hitRemoveCartItem(
          'api/delete-cart', cartID, userID);
      final parsedResponse = CartData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<PinCodeData?> getPinCodeStatus(String pinCode) async {
    try {
      final response =
          await _httpService.getPinCodeStatus('api/pincode-value', pinCode);
      final parsedResponse = PinCodeData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<PrimaryAddressData?> getPrimaryAddress(String userID) async {
    try {
      final response = await _httpService.getPrimaryAddress(
          'api/user-address-primary', userID);
      final parsedResponse = PrimaryAddressData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<EditCartData?> hitEditCartItem(
      String userID, String cartID, String quantity, String cartPrice) async {
    try {
      final response = await _httpService.hitEditCartItem(
          'api/edit-cart', userID, cartID, quantity, cartPrice);
      final parsedResponse = EditCartData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<ProfileData?> getProfileDetails(String userID) async {
    try {
      final response =
          await _httpService.getProfileDetails('api/get-profile', userID);
      final parsedResponse = ProfileData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<TrackData?> getTrackStutas(String orderID) async {
    try {
      final response =
          await _httpService.getTrackStutas('api/track?order_id=$orderID');
      final parsedResponse = TrackData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<ResponseData?> hitSubscriptionCheckApi(String userID) async {
    try {
      final response = await _httpService.hitSubscriptionCheckApi(
          'api/subscribtion-notification', userID);
      final parsedResponse = ResponseData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<CityListData?> hitCityApi(String stateID) async {
    try {
      final response = await _httpService.hitCityApi('api/city', stateID);
      final parsedResponse = CityListData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<StateListData?> hitStateApi() async {
    try {
      final response = await _httpService.hitStateApi('api/state-detail');
      final parsedResponse = StateListData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<CartData?> hitRemoveCartItemApi(String cartID, String userID) async {
    try {
      final response = await _httpService.hitRemoveCartItem(
          'api/delete-cart', cartID, userID);
      final parsedResponse = CartData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<FavouriteListData?> hitRemoveFavItemApi(
      String favID, String userID) async {
    try {
      final response = await _httpService.hitRemoveFavItemApi(
          'api/delete-favoritelist', favID, userID);
      final parsedResponse = FavouriteListData.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
