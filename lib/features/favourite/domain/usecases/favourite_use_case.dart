
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../error/failuar.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../repositories/favourite_repo.dart';

class FavouriteRemoveMovieParam {
  final MovieEntity movieEntity;

  FavouriteRemoveMovieParam(this.movieEntity);
}
class FavouriteAddMovieParam {
  final MovieEntity movieEntity;

  FavouriteAddMovieParam(this.movieEntity);
}

class GetFavouriteUserCase extends UseCase<List<MovieEntity>, NoParams> 
{
  final FavouriteRepoMovie favouriteRepository;

  GetFavouriteUserCase(this.favouriteRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) async {
    return await favouriteRepository.getFavouriteMovies();
  }
}

class FavouriteAddMovieUserCase extends UseCase<bool, FavouriteAddMovieParam> 
{
  final FavouriteRepoMovie favouriteRepository;

  FavouriteAddMovieUserCase(this.favouriteRepository);

  @override
  Future<Either<Failure, bool>> call(FavouriteAddMovieParam params) async {
    return await favouriteRepository.addFavouriteMovie(params.movieEntity);
  }
}

class FavouriteRemoveMovieUserCase extends UseCase<bool, FavouriteRemoveMovieParam> 
{
  final FavouriteRepoMovie favouriteRepository;

  FavouriteRemoveMovieUserCase(this.favouriteRepository);

  @override
  Future<Either<Failure, bool>> call(FavouriteRemoveMovieParam params) async {
    return await favouriteRepository.removeFavouriteMovie(params.movieEntity);
  }
}
