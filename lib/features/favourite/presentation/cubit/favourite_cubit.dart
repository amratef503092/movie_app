import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/usecases/favourite_use_case.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> 
{
  FavouriteCubit({
   required this.favouriteAddMovieUserCase,
    required this.favouriteRemoveMovieUserCase,
   required  this.getFavouriteUserCase
  
  }) : super(FavouriteInitial());
  FavouriteAddMovieUserCase favouriteAddMovieUserCase;
  FavouriteRemoveMovieUserCase favouriteRemoveMovieUserCase;
  GetFavouriteUserCase getFavouriteUserCase;  

  List<MovieEntity>? movies;
  void getFavouriteMovie() async
  {
    emit(FavouriteLoading());
    final result = await getFavouriteUserCase.call(NoParams());
    result.fold(
      (l) => emit(FavouriteError(l.message)),
      (r) 
      {
        movies = r;
        emit(FavouriteLoaded(r));
      },
    );
  }

  void addFavouriteMovie(MovieEntity movieEntity) async
  {
    emit(FavouriteLoading());
    final result = await favouriteAddMovieUserCase.call(FavouriteAddMovieParam(movieEntity));
    result.fold(
      (l) => emit(FavouriteError(l.message)),
      (r) 
      {
        movies!.add(movieEntity);
        emit(FavouriteAdded(movieEntity));
      },
    );
  }
  void removeFavouriteMovie(MovieEntity movieEntity) async
  {
    emit(FavouriteLoading());
    final result = await favouriteRemoveMovieUserCase.call(FavouriteRemoveMovieParam(movieEntity));
    result.fold(
      (l) => emit(FavouriteError(l.message)),
      (r) 
      {
        movies!.remove(movieEntity);
        emit(FavouriteRemoved(movieEntity));
      },
    );
  }
}

// 1 create 2 locacl 
// 1 create save movie