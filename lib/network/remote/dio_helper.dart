import 'package:dio/dio.dart';

class dioHelper{

  static Dio? dio;

  static dioInit(){
    dio=Dio(
      BaseOptions(
         baseUrl: "https://newsdata.io/",
             receiveDataWhenStatusError: true
      )
    );
  }

  static Future<Response?> get({
    required String url,
    required Map<String,dynamic> query
})async{
    return await dio?.get(url,queryParameters: query);

  }
}