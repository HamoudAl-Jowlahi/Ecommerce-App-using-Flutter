import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/constans.dart';

class WebServices {
  static WebServices? _this;

  factory WebServices() {
    _this ??= WebServices._();
    return _this!;
  }

  Dio freeDio = Dio();
  Dio tokenDio = Dio();

  String lang = "en";
  // String? nonce;
  String? myToken;
  final String storageKeyMobileToken = "Authorization";

  WebServices._() {
    freeDio.options.connectTimeout = const Duration(milliseconds: 30000);
    freeDio.options.baseUrl = Constants.domain;

    tokenDio.options.connectTimeout = const Duration(milliseconds: 30000);
    tokenDio.options.baseUrl = Constants.domain;
    // initializeInterceptors();

    initializeInterceptors();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> setMobileToken(String? token) async {
    myToken = token;
    final SharedPreferences prefs = await _prefs;
    if(token == null){
      prefs.remove(storageKeyMobileToken);
      return Future<bool>.value(false);
    } else {
      return prefs.setString(storageKeyMobileToken, token);
    }
  }
  Future<String?> getMobileToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(storageKeyMobileToken);
  }
  Future<void> initializeToken() async {
  myToken = await getMobileToken();
  return;
  }

  initializeInterceptors() {
    freeDio.interceptors.clear();
    tokenDio.interceptors.clear();
    // freeDio interceptors
    freeDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options,handler) {
          // options.headers['Accept-Language'] = navigatorKey.currentContext!.local;
          debugPrint('send request: baseURL: ${options.baseUrl} path:${options.path}');
          debugPrint('headers: ${options.headers}');
          debugPrint('query parameters: ${options.queryParameters}');
          debugPrint('data: ${options.data}');

          return handler.next(options);
        },
        onResponse: (response,handler){
          debugPrint('status code: ${response.statusCode}');
          debugPrint('data: ${response.data}');

          log(response.data.toString());
          return handler.next(response);
        },
          ///////////////////////////////////////////////////////////////////////////////////////////////////////////
          ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        onError: (DioError e,handler) async{

          debugPrint('status code: ${e.response?.statusCode}');
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('data: ${e.response?.data}');
          debugPrint('error: ${e.error}');
          debugPrint('message: ${e.message}');
          debugPrint('type: ${e.type}');

          EasyLoading.dismiss();

          // return handler.next(e);
        }
      )
    );
    tokenDio.interceptors.add(
        InterceptorsWrapper(
            onRequest: (options,handler) {
              options.headers['Authorization'] = "Bearer $myToken ";

              debugPrint('send request path: ${options.path} baseURL: ${options.baseUrl} ');
              debugPrint('method: ${options.method}');
              debugPrint('headers: ${options.headers}');
              debugPrint('data: ${options.data}');
              debugPrint('query parameters: ${options.queryParameters}');


              return handler.next(options);
            },
            onResponse: (response,handler){
              debugPrint('status code: ${response.statusCode}');
              debugPrint('data: ${response.data}');

              log(response.data.toString());
              return handler.next(response);
            },
            //////////////////////////////////////////////I didnt see/////////////////////////////////////////////////////////////
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////
            onError: (DioError e,handler) async{

              debugPrint('status code: ${e.response?.statusCode}');
              debugPrint('path: ${e.requestOptions.path}');
              debugPrint('response: ${e.response}');
              debugPrint('data: ${e.response?.data}');
              debugPrint('error: ${e.error}');
              debugPrint('message: ${e.message}');
              debugPrint('type: ${e.type}');

              EasyLoading.dismiss();

              // return handler.next(e);
            }
        )
    );
  }
}