import 'dart:convert';

import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../home/domain/entities/movie_entity.dart';

abstract class FavouriteLocalDataSource {
   List<MovieEntity> getFavouriteMovies();
  Future<bool> addFavouriteMovie(MovieEntity movieEntity);
  Future<bool> removeFavouriteMovie(MovieEntity movieEntity);
}

String FAVOURITE_MOVIE_KEY = 'FAVOURITE_MOVIE_KEY';

class FavouriteLocalDataSourceImpl implements FavouriteLocalDataSource {
  final SharedPreferences sharedPreferences;
  FavouriteLocalDataSourceImpl(this.sharedPreferences);
  @override
  Future<bool> addFavouriteMovie(MovieEntity movieEntity) 
  {
    List<MovieEntity> movieEntities = [];
    final response = sharedPreferences.getString(FAVOURITE_MOVIE_KEY);
    if (response != null) {
      var convert = jsonDecode(response);
      convert.forEach((element) {
        movieEntities.add(MovieModel.fromJson(element));
      });
    }
    movieEntities.add(movieEntity);
    return sharedPreferences.setString(
        FAVOURITE_MOVIE_KEY, jsonEncode(movieEntities));
  }

  @override
  List<MovieModel> getFavouriteMovies() 
  {
    List<MovieModel> movieEntities = [];
    final response = sharedPreferences.getString(FAVOURITE_MOVIE_KEY);
    if (response != null) {
      var convert = jsonDecode(response);
      convert.forEach((element) {
        movieEntities.add(MovieModel.fromJson(element));
      });
    }
    return movieEntities;
  }

  @override
  Future<bool> removeFavouriteMovie(MovieEntity movieEntity) 
  {
    List<MovieModel> movieEntities = [];
    final response = sharedPreferences.getString(FAVOURITE_MOVIE_KEY);
    if (response != null) {
      var convert = jsonDecode(response);
      convert.forEach((element) {
        movieEntities.add(MovieModel.fromJson(element));
      });
    }
    movieEntities.removeWhere((element) => element.id == movieEntity.id);
    return sharedPreferences.setString(
        FAVOURITE_MOVIE_KEY, jsonEncode(movieEntities));
  }
}
