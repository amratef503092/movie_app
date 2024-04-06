import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/get_movie_entitiy.dart';
import '../../domain/usecases/get_movie_usecase.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> 
{
  MovieCubit(this.movieUseCase) : super(MovieInitial());
  GetMovieUseCase movieUseCase;
  ScrollController scrollController = ScrollController();
   GetMovieEntity  ?getMovieEntity;
   TextEditingController searchController = TextEditingController();
  int page = 1;
  onscroll()
  {
    scrollController.addListener(() 
    {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent)
      {
        if(getMovieEntity!.totalPages > page)
        {
          page++;
          getDiscoverMovie(page);
          }
    }
    });
   
  }

  void getDiscoverMovie(int page) async
  {
    if(getMovieEntity == null)
    {
          emit(MovieLoading());

    }
    final result = await movieUseCase.call(MovieParams(
      page: page,
    ));
    result.fold(
      (l) => emit(MovieError(l.message)),
      (r) 
      {
        if(getMovieEntity == null)
        {
          getMovieEntity = r;
        }
        else
        {
          getMovieEntity!.movies.addAll(r.movies);
        }
        
          emit(MovieLoaded(getMovieEntity!  ));
      },
    );
  }
}
