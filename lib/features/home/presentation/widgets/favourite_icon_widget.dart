

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/util/color_manager/color_manager.dart';

import '../../../favourite/presentation/cubit/favourite_cubit.dart';
import '../../domain/entities/movie_entity.dart';

class FavouriteIconWidget extends StatelessWidget 
{
   const FavouriteIconWidget({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;
  
  @override
  Widget build(BuildContext context) 
  {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
    
      
    
      builder: (context, state) 
      {
        var favouriteCubit = context.read<FavouriteCubit>();
        return IconButton(
            onPressed: () 
            {
              if (favouriteCubit.movies!.contains(movie))
              {
              
              favouriteCubit.removeFavouriteMovie(movie);

              }
              else
              {
               favouriteCubit.addFavouriteMovie(movie);
              }

            },
            icon:  !favouriteCubit.movies!.contains(movie) ? 
             Icon(Icons.bookmark_outline , 
            color: 
             Colors.white,
            size: 30.sp,
            ) 
            :  Icon(Icons.bookmark , 
            color: 
             ColorManager.primaryColor,
            size: 30.sp,
            ) ) ;
      },
    );
  }
}
