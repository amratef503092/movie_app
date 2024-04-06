
import 'package:dartz/dartz.dart';

import '../../../../error/failuar.dart';
import '../entities/get_movie_entitiy.dart';

abstract class MovieRepository {
  Future<Either<Failure, GetMovieEntity>> getDiscoverMovie(int page);
}