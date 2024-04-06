
import 'package:dartz/dartz.dart';
import 'package:movie_app/features/home/domain/entities/get_movie_entitiy.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../error/failuar.dart';
import '../repositories/get_movie_repo.dart';

class GetMovieUseCase extends UseCase<GetMovieEntity, MovieParams> {
  final MovieRepository repository;

  GetMovieUseCase(this.repository);

  @override
  Future<Either<Failure, GetMovieEntity>> call(MovieParams params) async 
  {
    return await repository.getDiscoverMovie(params.page);
  }
}

class MovieParams extends NoParams
{
  final int page;
  MovieParams({required this.page}); 
}