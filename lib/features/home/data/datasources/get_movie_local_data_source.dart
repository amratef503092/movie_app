import 'dart:convert';

import 'package:movie_app/features/home/data/models/get_movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetMovieLocalDataSource
{
  Future<GetMovieModel> getDiscoverMovie();
  Future<void> cacheDiscoverMovie(GetMovieModel model);
}

const String GET_MOVIE_LOCAL_DATA_SOURCE = "GET_MOVIE_LOCAL_DATA_SOURCE";

class GetMovieLocalDataSourceImpl implements GetMovieLocalDataSource
{
  final SharedPreferences sharedPreferences;
  GetMovieLocalDataSourceImpl(this.sharedPreferences);
  @override
  Future<GetMovieModel> getDiscoverMovie() async
  {
    final response = sharedPreferences.getString(GET_MOVIE_LOCAL_DATA_SOURCE);
    return GetMovieModel.fromJson(jsonDecode(response!));
  }
  
  @override
  Future<void> cacheDiscoverMovie(GetMovieModel model) 
  {
    return sharedPreferences.setString(GET_MOVIE_LOCAL_DATA_SOURCE, jsonEncode(model.toJson()));
  }
}