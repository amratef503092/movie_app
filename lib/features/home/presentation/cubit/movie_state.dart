part of 'movie_cubit.dart';

sealed class MovieState {

}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}
final class MovieLoaded extends MovieState {
  final GetMovieEntity getMovieEntity;
   MovieLoaded(this.getMovieEntity );



}

class MovieError extends MovieState {
  final String message;

   MovieError(this.message);
}
