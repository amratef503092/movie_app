import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common_widget/custom_gride_view_widget.dart';
import '../cubit/movie_cubit.dart';

class HomePage extends StatelessWidget 
{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
    
      body: 
    BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        MovieCubit movieCubit = context.read<MovieCubit>();
        if (state is MovieLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieError) {
          return Center(
            child: Text(state.message),
          );
        } else if (movieCubit.getMovieEntity != null) 
        {
          return CustomGridViewWidget(
            listMovie: movieCubit.getMovieEntity!.movies,
            scrollController: movieCubit.scrollController,
          );
        } else {
          return const SizedBox();
        }
      },
    ));
  }
}

