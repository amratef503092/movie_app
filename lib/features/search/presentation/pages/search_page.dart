import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/service_locator/service_locator.dart';
import 'package:movie_app/features/search/presentation/cubit/search_cubit.dart';
import '../../../../core/common_widget/custom_gride_view_widget.dart';
import '../../../home/domain/entities/movie_entity.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchCubit>(),
      child: Scaffold(
  
        body: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {},
          builder: (context, state) {
            SearchCubit searchCubit = context.read<SearchCubit>();
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchCubit.searchController,
                    onChanged: (value) {
                      if (value.length >= 3) {
                        searchCubit.onscroll();
                        searchCubit.searchMovie(1);
                      } else if (value.isEmpty) {
                        searchCubit.clearMovie();
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search Movie',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.search , color: Colors.white,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      fillColor: Color(0xFF2A2A2A),
                      filled: true
                  
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if(state is SearchLoading) ...[
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ]
                else if(state is SearchError) ...[
                  Center(
                    child: Text(state.message),
                  ),
                ]
                else if(state is SearchLoaded) ...
                [
  Expanded(
                  child: CustomGridViewWidget(
                    listMovie: searchCubit.getMovieEntity?.movies ??
                        <MovieEntity>[], //state is MovieLoaded ? state.movies : <MovieEntity>[],
                    scrollController: searchCubit.scrollController,
                  ),
                ),
                ]

               
              ],
            );
          },
        ),
      ),
    );
  }
}
