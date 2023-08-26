import 'dart:io';

import 'package:dio/dio.dart';

abstract class HttpService {
  void init();

  // Future<Response> getRequest(String url);
  Future<Response> getHomePageList(String url, String userID);
  Future<Response> getCategoryList(String url);
  Future<Response> getPlanList(String url);
  Future<Response> getFoodList(String url);
  Future<Response> hitLoginApi(String url, String mobile, String firebaseID,
      String deviceToken, String userType);
  Future<Response> hitEditProfileApi(String url, String id, String name,
      String email, String address, File image);
  Future<Response> hitAddCartApi(
    String url,
    String userID,
    String foodID,
    String quantity,
    String price,
  );
  Future<Response> hitCartList(String url, String userID);
  Future<Response> hitFavouriteList(String url, String userID);
  Future<Response> hitAddFavouriteApi(String url, String userID, String foodID);
  Future<Response> hitShortCategoryApi(String url, String category);
  Future<Response> hitOrderApi(
    String url,
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

  Future<Response> hitSubscriptionApi(
    String url,
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
  Future<Response> hitCancelSubscriptionApi(
    String url,
    String id,
    String isActive,
    String dateTimeCancle,
    String actualDateTimeEnd,
    String userID,
  );
  Future<Response> getCancelSubscriptionList(String url, String userID);
  Future<Response> getSubscriptionList(String url, String userID);
  Future<Response> hitAddAddressApi(
      String url,
      String userID,
      String name,
      String phone,
      String address,
      String pinCode,
      String contry,
      String state,
      String city);
  Future<Response> hitEditAddressApi(
      String url,
      String id,
      String name,
      String phone,
      String address,
      String pinCode,
      String contry,
      String state,
      String city);
  Future<Response> getAddressList(String url, String userID);
  Future<Response> hitDeleteAddressApi(String url, String id, String userID);
  Future<Response> getFoodDetails(String url, String id, String userID);
  Future<Response> getAddressDetails(String url, String id);
  Future<Response> getMyOrderList(String url, String userID);
  Future<Response> hitSetPrimaryAddress(
      String url, String id, String userID, String primaryType);
  Future<Response> getSearchResult(String url, String search);
  Future<Response> hitRemoveCartItem(String url, String cartID, String userID);
  Future<Response> getPrimaryAddress(String url, String userID);
  Future<Response> getProfileDetails(String url, String userID);
  Future<Response> getPinCodeStatus(String url, String pinCode);
  Future<Response> getTrackStutas(String url);
  Future<Response> hitEditCartItem(String url, String userID, String cartID,
      String quantity, String cartPrice);
  Future<Response> hitSubscriptionCheckApi(String url, String userID);
  Future<Response> hitStateApi(String url);
  Future<Response> hitCityApi(String url, String stateID);
  Future<Response> hitRemoveCartItemApi(
      String url, String cartID, String userID);
  Future<Response> hitRemoveFavItemApi(String url, String favID, String userID);
}
