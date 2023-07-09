import 'package:dio/dio.dart';

// class to use dio to interact with api
class DioHelper {
// declare static variable from type Dio
  static Dio? dio;
// make init method to intialize variable and api location
  static init() {
    // intialize the varriable dio and give it constractor Dio()
    dio = Dio(
      // this constractor take object baseoptions() to intialize in it baseurl
      BaseOptions(
        // baseUrl that lead us to server which store api data on it
        baseUrl: 'https://student.valuxapps.com/api/',
        // this make app return data untill error happened when call data
        receiveDataWhenStatusError: true,
        // we can add headers here put headers will not change
      ),
    );
  }

// make get method and take path and query parameters to get what data we want when we call it
  static Future<Response> getData({
    required String path,
    String lang = 'en',
    String? token,
    Map<String, dynamic>? query,
  }) async {
    // to make Edit on headers
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    // give it the path and query(key:value) to return data that we want
    return await dio!.get(path, queryParameters: query);
  }

  // make get method and take path parameters to send Data
  static Future<Response> postData({
    required String url,
    String lang = 'en',
    String? token,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    // to make Edit on headers
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  // make get method and take path parameters to Change Data
  static Future<Response> putData({
    required String url,
    String lang = 'en',
    String? token,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    // to make Edit on headers
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
