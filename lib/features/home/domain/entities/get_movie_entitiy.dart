
import 'package:equatable/equatable.dart';

import 'movie_entity.dart';

class GetMovieEntity extends Equatable
{
  final int page;
  final List<MovieEntity> movies;
  final int totalResults;
  final int totalPages;
  
  const GetMovieEntity({
    required this.page,
    required this.movies,
    required this.totalResults,
    required this.totalPages,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [page, movies, totalResults, totalPages];
}


