
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:movie_app/error/failuar.dart';

import 'package:movie_app/features/home/domain/entities/get_movie_entitiy.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/get_movie_repo.dart';
import '../datasources/get_movie_local_data_source.dart';
import '../datasources/get_movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository 
{

  final GetMovieRemoteDataSource getMovieDataSource;
  final GetMovieLocalDataSource getMovieLocalDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl(this.getMovieDataSource , this.getMovieLocalDataSource , this.networkInfo);

  @override
  Future<Either<Failure, GetMovieEntity>> getDiscoverMovie(int page) 
  async
  {
    if(await networkInfo.isConnected)
    {
      try
      {
        final remoteData = await getMovieDataSource.getDiscoverMovie(page);
        await getMovieLocalDataSource.cacheDiscoverMovie(remoteData);
        return Right(remoteData);
      }
      on DioException catch(e)
      {
        return Left(ServerFailure.fromDioError(e));
      }
      catch(e)
      {
      
        return Left(FailureLocal(message: e.toString()));
      }
    }
    else
    {
      try
      {
        final localData = await getMovieLocalDataSource.getDiscoverMovie();
        return Right(localData);
      }
      catch(e)
      {
        return Left(FailureLocal(message: e.toString()));
      }
    }

  }

  


  
}