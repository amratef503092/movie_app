
import 'package:dartz/dartz.dart';
import 'package:movie_app/error/failuar.dart';
import 'package:movie_app/features/home/domain/entities/get_movie_entitiy.dart';
import 'package:movie_app/features/search/data/datasources/search_movie_remote_data_source.dart';

import '../../domain/repositories/search_repo.dart';

class SearchRepoImpl implements SearchRepository {
  final SearchMovieRemoteDataSourceImpl remoteDataSource;

  SearchRepoImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, GetMovieEntity>> searchMovie( page, String query) 
  async
  {
    try
    {
      final remoteData = await remoteDataSource.searchMovie(page, query);
      return Right(remoteData);
    }
    on Exception catch(e)
    {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  

}