import 'package:dio/dio.dart';

abstract class EndPoints
{
  static const String baseUrl = 'https://api.themoviedb.org/';
  static const String apiKey = 'd02c8f09e8c00b644d6b848475b48511';
  static const String discoverEndpoint = "3/discover/movie";
    static const String searchMovie = "3/search/movie";

  static const String imageUrl ="https://image.tmdb.org/t/p/w500/";
}
BaseOptions getBaseOptions()
{
  return BaseOptions(
    //Here the URL of API.
    baseUrl: EndPoints.baseUrl,
    connectTimeout: const Duration(minutes: 2),
    receiveDataWhenStatusError: true,
    //Here we Put The Headers Needed in The API.
    headers: {
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET,PUT,POST,DELETE,PATCH,OPTIONS"
      //'lang':'en'
    },
  );
}