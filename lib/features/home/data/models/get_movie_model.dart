
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/domain/entities/get_movie_entitiy.dart';


class GetMovieModel extends GetMovieEntity {
   const GetMovieModel({
    required super.page,
    required List<MovieModel> super.movies,
    required super.totalResults,
    required super.totalPages,
  });

  factory GetMovieModel.fromJson(Map<String, dynamic> json) {
    return GetMovieModel(
      page: json['page'],
      movies: List<MovieModel>.from(json['results'].map((x) => MovieModel.fromJson(x))),
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
    );
  }

  toJson() {
    return {
      'page': page,
      'results': movies.map((e) => e.toJson()).toList(),
      'total_results': totalResults,
      'total_pages': totalPages,
    };
  }
  
  
}