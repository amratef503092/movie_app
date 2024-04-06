
import 'package:dartz/dartz.dart';

import '../../../../error/failuar.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/repositories/favourite_repo.dart';
import '../datasources/favourite_local_data_source.dart';

class FavouriteRepoImpl implements FavouriteRepoMovie 
{
  final FavouriteLocalDataSource favouriteLocalDataSource;

  FavouriteRepoImpl(this.favouriteLocalDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getFavouriteMovies() async 
  {
    try {
      final response = favouriteLocalDataSource.getFavouriteMovies();
      return Right(response);
    } catch (e) {
      return Left(FailureLocal(message:e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addFavouriteMovie(MovieEntity movieEntity)
   async 
  {
    try {
      final response = await favouriteLocalDataSource.addFavouriteMovie(movieEntity);
      return Right(response);
    } catch (e) {
      return Left(FailureLocal(message:e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> removeFavouriteMovie(MovieEntity movieEntity) async 
  {
    try {
      final response = await favouriteLocalDataSource.removeFavouriteMovie(movieEntity);
      return Right(response);
    } catch (e) {
      return Left(FailureLocal(message:e.toString()));
    }
  }
}