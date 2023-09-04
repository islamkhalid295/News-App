import 'package:dio/dio.dart';

//GET https://newsapi.org/v2/top-headlines?country=eg&apiKey=904c22d11a6c43fc9e5f24f8c1bb5cb8
// https://newsdata.io/api/1/news?country=eg&apikey=pub_28793fc9a3e454f2a8bd56e834c38948d309d
class DioHelper {
  static Dio? dio;

  static init (){
    dio = Dio(BaseOptions(baseUrl: 'https://newsdata.io/', receiveDataWhenStatusError: true));
  }

  static Future<Response> getData (url,quary)async{
    return await dio!.get(url ,queryParameters: quary);
  }
}