import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/search/presentation/pages/search_page.dart';

import '../../../favourite/presentation/pages/favourite_page.dart';
import '../../../home/presentation/pages/home_page.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> 
{
  HomeLayoutCubit() : super(HomeLayoutInitial());
  List<Widget> pages = 
  [
    const HomePage(),
    const SearchPage(),
    const FavoritePage()
  ];

  List <String> titles = 
  [
    'Discover',
    'Search',
    'Bookmarks'
  ];
  int currentIndex = 0;

  void changePage(int index) 
  {
    currentIndex = index;
    emit(HomeLayoutChangePage(currentIndex));
  }
}
