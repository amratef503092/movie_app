import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/entities/get_movie_entitiy.dart';
import 'package:movie_app/features/search/domain/usecases/seatch_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> 
{
  SearchCubit({required this.searchUseCase}) : super(SearchInitial());
  SearchUseCase searchUseCase;
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  GetMovieEntity ?getMovieEntity;

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
          searchMovie(page);
        }
      }
    });
  }
  
  Future<void> searchMovie(int page) async
  {
    if(getMovieEntity == null)
    {
      emit(SearchLoading());
    }
    final result = await searchUseCase.call(SearchPrams(
    page,
    searchController.text,
    ));
    result.fold(
      (l) => emit(SearchError(l.message)),
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
        emit(SearchLoaded(getMovieEntity!));
      },
    );
  }

  void clearMovie()
  {
    getMovieEntity = null;
    emit(SearchInitial());
  }
  
  


  
  

}
