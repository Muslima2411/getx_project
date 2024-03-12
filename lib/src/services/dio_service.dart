import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../data/entity/product_model.dart';

class DioService{

  ///base URL
  static const baseUrl = "https://65a77f0194c2c5762da6cce6.mockapi.io";

  ///apis
  static const api = "/products";

  ///headers
  static const header = {
    'Content-Type': 'application/json',
  };

  ///params
  static const Map<String, dynamic> params = {};

  ///base options
  static final BaseOptions _baseDioOptions = BaseOptions(
    baseUrl: baseUrl,
    headers: header,
    connectTimeout: const Duration(seconds: 4000),
    receiveTimeout: const Duration(seconds: 4000),
    contentType: 'application/json',
    responseType: ResponseType.json,
  );

  static Dio dio = Dio(_baseDioOptions);

  ///get method
 static Future<List<Welcome>?> getData() async {
    try {
      Response response = await dio.get(api, queryParameters: params);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Successfully gotten");
        print(response.data[0]);
        List<dynamic> responseData = response.data;
        List<Welcome> welcomeList = responseData.map((e) => Welcome.fromJson(e)).toList();
        return welcomeList;
      } else {
        return null;
      }
    } catch (e) {
      print("Error getting data: $e");
      return null;
    }
    return null;
  }


  ///post method
  static Future<String> postData(Map<String, dynamic> data) async{
    try{
      final Response response = await dio.post(api, queryParameters: params, data: data);
      return jsonEncode(response.data);
    }catch(e){
      return e.toString();
    }
  }

  ///update method
  static Future<String> putData(Map<String, dynamic> data, String id) async{
    try{
      final Response response = await dio.put('$api/$id', data: data);
      return jsonEncode(response.data);
    }catch(e){
      return e.toString();
    }
  }

  ///delete method
  static Future<String> deleteData(String id) async{
    try{
      final Response response = await dio.delete('$api/$id');
      return jsonEncode(response.data);
    }catch(e){
      return e.toString();
    }
  }
}