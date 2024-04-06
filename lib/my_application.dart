import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/favourite/presentation/cubit/favourite_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/features/home_layout/presentation/cubit/home_layout_cubit.dart';
import 'core/service_locator/service_locator.dart';
import 'core/util/theme/theme.dart';
import 'features/home_layout/presentation/pages/home_layout.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<MovieCubit>()..getDiscoverMovie(1)..onscroll(),
        ),
        BlocProvider(
          create: (context) =>  sl<FavouriteCubit>()..getFavouriteMovie(),
        ),
        BlocProvider(
          create: (context) =>  HomeLayoutCubit(),
        ),
      ],
      child:  
      ScreenUtilInit(
              designSize: const Size(411, 823),
      minTextAdapt: true,
      splitScreenMode: true,

        builder: (context, child) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
        theme: themeData,
        title: 'Movie App', 
        home: child);
        },
        child: const HomeLayout(),
      ),
      
     
    );
  }
}
