import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/favourite/presentation/cubit/favourite_cubit.dart';

import '../../../../core/common_widget/custom_gride_view_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    context.read<FavouriteCubit>().getFavouriteMovie();
    return BlocBuilder<FavouriteCubit, FavouriteState>(
     
      builder: (context, state) 
      {
        FavouriteCubit favouriteCubit = context.read<FavouriteCubit>();
        return  Scaffold(
          body: favouriteCubit.movies!=null ? 
          CustomGridViewWidget(
            listMovie: favouriteCubit.movies ?? [],
          ) : const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
