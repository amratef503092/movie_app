
import 'package:dartz/dartz.dart';
import 'package:movie_app/features/home/domain/entities/get_movie_entitiy.dart';

import '../../../../error/failuar.dart';

abstract class SearchRepository {
  Future<Either<Failure,  GetMovieEntity>> searchMovie( page, String query);
}