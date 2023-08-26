import 'dart:io';

import 'package:saket_sweets_app/models/index.dart';

abstract class Repo {
  Future<HomeData?> getHomePageList(String userID);
  Future<CategoriesData?> getCategoryList();
  Future<PlanData?> getPlanList();
  Future<FoodItemData?> getFoodList();
  Future<UserData?> hitLoginApi(
      String mobile, String firebaseID, String deviceToken, String userType);
  Future<UserData?> hitEditProfileApi(
      String id, String name, String email, String address, File image);

  Future<AddCartData?> hitAddCartApi(
    String userID,
    String foodID,
    String quantity,
    String price,
  );
  Future<CartData?> hitCartList(String userID);
  Future<FavouriteListData?> hitFavouriteList(String userID);
  Future<AddFavouriteData?> hitAddFavouriteApi(String userID, String foodID);
  Future<ShortFoodData?> hitShortCategoryApi(String category);
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
  );

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
  );
  Future<SubscriptionData?> hitCancelSubscriptionApi(
    String id,
    String isActive,
    String dateTimeCancle,
    String actualDateTimeEnd,
    String userID,
  );
  Future<SubscriptionData?> getCancelSubscriptionList(String userID);
  Future<SubscriptionData?> getSubscriptionList(String userID);
  Future<AddressData?> hitAddAddressApi(
      String userID,
      String name,
      String phone,
      String address,
      String pinCode,
      String contry,
      String state,
      String city);
  Future<AddressData?> hitEditAddressApi(String id, String name, String phone,
      String address, String pinCode, String contry, String state, String city);
  Future<AddressData?> getAddressList(String userID);
  Future<AddressData?> hitDeleteAddressApi(String id, String userID);
  Future<SingleFoodData?> getFoodDetails(String id, String userID);
  Future<SingleAddressData?> getAddressDetails(String id);
  Future<MyOrderItemData?> getMyOrderList(String userID);
  Future<AddressData?> hitSetPrimaryAddress(
      String id, String userID, String primaryType);
  Future<SearchData?> getSearchResult(String search);
  Future<CartData?> hitRemoveCartItem(String cartID, String userID);
  Future<PrimaryAddressData?> getPrimaryAddress(String userID);
  Future<PinCodeData?> getPinCodeStatus(String pinCode);
  Future<EditCartData?> hitEditCartItem(
      String userID, String cartID, String quantity, String cartPrice);
  Future<ProfileData?> getProfileDetails(String userID);
  Future<TrackData?> getTrackStutas(String orderID);
  Future<ResponseData?> hitSubscriptionCheckApi(String userID);
  Future<StateListData?> hitStateApi();
  Future<CityListData?> hitCityApi(String stateID);
  Future<CartData?> hitRemoveCartItemApi(String cartID, String userID);
  Future<FavouriteListData?> hitRemoveFavItemApi(String favID, String userID);
}
