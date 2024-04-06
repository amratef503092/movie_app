
import 'package:dartz/dartz.dart';
import 'package:movie_app/error/failuar.dart';
import 'package:movie_app/features/home/domain/entities/movie_entity.dart';

abstract class FavouriteRepoMovie
{
  Future<Either<Failure, List<MovieEntity>>> getFavouriteMovies();
  Future<Either<Failure, bool>> addFavouriteMovie(MovieEntity movieEntity);
  Future<Either<Failure, bool>> removeFavouriteMovie(MovieEntity movieEntity);
}