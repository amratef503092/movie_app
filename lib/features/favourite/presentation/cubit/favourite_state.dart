part of 'favourite_cubit.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}
class FavouriteLoaded extends FavouriteState {
  final List<MovieEntity> movies;

  const FavouriteLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class FavouriteError extends FavouriteState {
  final String message;

  const FavouriteError(this.message);

  @override
  List<Object> get props => [message];
}

class FavouriteEmpty extends FavouriteState {}

class FavouriteAdded extends FavouriteState 
{
  final MovieEntity movieEntity;

  const FavouriteAdded(this.movieEntity);

  @override
  List<Object> get props => [movieEntity];
}

class FavouriteRemoved extends FavouriteState {
  final MovieEntity movieEntity;

  const FavouriteRemoved(this.movieEntity);

  @override
  List<Object> get props => [movieEntity];
}
