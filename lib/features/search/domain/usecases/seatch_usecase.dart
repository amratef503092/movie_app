
import 'package:dartz/dartz.dart';
import 'package:movie_app/features/home/domain/entities/get_movie_entitiy.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../error/failuar.dart';
import '../repositories/search_repo.dart';

class SearchPrams
{
  final int page;
  final String query;

  SearchPrams(this.page, this.query);

}
class SearchUseCase extends UseCase<GetMovieEntity, SearchPrams> {
  final SearchRepository repository;

  SearchUseCase(this.repository);

  @override
  Future<Either<Failure, GetMovieEntity>> call(SearchPrams params) async 
  {
    return await repository.searchMovie(params.page, params.query);
  }
}