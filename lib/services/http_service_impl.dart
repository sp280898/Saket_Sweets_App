import 'dart:io';

import 'package:dio/dio.dart';
import 'package:saket_sweets_app/services/http_service.dart';

const BASE_URL = "https://holdingshand.com/";

class HttpServiceImpl implements HttpService {
  late Dio _dio;

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) {
      print(error.message);
      return handler.next(error);
    }, onRequest: (request, handler) {
      print('${request.method} | ${request.path} | ${request.data}');
      return handler.next(request);
    }, onResponse: (response, handler) {
      print(
          "${response.statusCode} | ${response.statusMessage} | ${response.data}");
      return handler.next(response);
    }));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL));
    initializeInterceptors();
  }

  @override
  Future<Response> getCategoryList(String url) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getFoodList(String url) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getHomePageList(String url, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getPlanList(String url) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitEditProfileApi(String url, String id, String name,
      String email, String address, File image) async {
    Response response;
    String fileName = image.path;
    try {
      FormData formData = FormData.fromMap({
        'user_id': id,
        'name': name,
        'email': email,
        'address': address,
        'image': await MultipartFile.fromFile(image.path, filename: fileName),
      });
      response = await _dio.post(url, data: formData);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitLoginApi(String url, String mobile, String firebaseID,
      String deviceToken, String userType) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'mobile': mobile,
        'firebase_id': firebaseID,
        'device_token': deviceToken,
        'user_type': userType
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitAddCartApi(
    String url,
    String userID,
    String foodID,
    String quantity,
    String price,
  ) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'food_id': foodID,
        'quantity': quantity,
        'price': price
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitAddFavouriteApi(
      String url, String userID, String foodID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'food_id': foodID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitCartList(String url, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitFavouriteList(String url, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitShortCategoryApi(String url, String category) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'category': category,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getAddressList(String url, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getCancelSubscriptionList(String url, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getSubscriptionList(String url, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitAddAddressApi(
    String url,
    String userID,
    String name,
    String phone,
    String address,
    String pinCode,
    String contry,
    String state,
    String city,
  ) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'name': name,
        'mobile': phone,
        'address': address,
        'pin_code': pinCode,
        'country': contry,
        'state': state,
        'city': city,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitCancelSubscriptionApi(
      String url,
      String id,
      String isActive,
      String dateTimeCancle,
      String actualDateTimeEnd,
      String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'id': id,
        'is_active': isActive,
        'date_time_cancel': dateTimeCancle,
        'actual_date_time_end': actualDateTimeEnd,
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitDeleteAddressApi(
      String url, String id, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'id': id,
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitEditAddressApi(
    String url,
    String id,
    String name,
    String phone,
    String address,
    String pinCode,
    String contry,
    String state,
    String city,
  ) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'id': id,
        'name': name,
        'mobile': phone,
        'address': address,
        'pin_code': pinCode,
        'country': contry,
        'state': state,
        'city': city,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
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
  ) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'food_id': foodID,
        'order_date_time': orderDateTime,
        'estimate_delivary_time': estimateDelivaryTime,
        'status': status,
        'delivary_address': deliveryAddress,
        'discount': discount,
        'final_price': finalPrice,
        'comment': comment,
        'payment_type': paymentType,
        'payment_id': paymentID,
        'address': address,
        'state': state,
        'postal_code': pinCode,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
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
  ) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'food_id': foodID,
        'plan_id': planID,
        'date_time_start': dateTimeStart,
        'date_time_end': dateTimeEnd,
        'is_paid_full': isPaidFull,
        'is_active': isActive,
        'date_time_cancel': dateTimeCancle,
        'actual_date_time_end': actualDateTimeEnd,
        'payment_type': paymentType,
        'payment_id': paymentID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getAddressDetails(String url, String id) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'id': id,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getFoodDetails(String url, String id, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'id': id,
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getMyOrderList(String url, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitSetPrimaryAddress(
      String url, String id, String userID, String primaryType) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'id': id,
        'user_id': userID,
        'primary_type': primaryType,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getSearchResult(String url, String search) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'search': search,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitRemoveCartItem(
      String url, String cartID, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'cart_id': cartID,
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getPinCodeStatus(String url, String pinCode) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'pin_code': pinCode,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getPrimaryAddress(String url, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitEditCartItem(String url, String userID, String cartID,
      String quantity, String totalPrice) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
        'id': cartID,
        'quantity': quantity,
        'cart_price': totalPrice,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getProfileDetails(String url, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getTrackStutas(String url) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitSubscriptionCheckApi(String url, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitCityApi(String url, String stateID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'short_name': stateID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitStateApi(String url) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitRemoveCartItemApi(
      String url, String cartID, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'cart_id': cartID,
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> hitRemoveFavItemApi(
      String url, String favID, String userID) async {
    // TODO: implement getSingIn
    Response response;
    try {
      response = await _dio.post(url, data: {
        'fav_id': favID,
        'user_id': userID,
      });
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}
