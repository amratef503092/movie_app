import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/favourite/presentation/cubit/favourite_cubit.dart';
import '../widgets/custom_body_layout.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/custom_title_app_bar.dart';

class HomeLayout extends StatelessWidget 
{
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) 
  {
    context.read<FavouriteCubit>().getFavouriteMovie();
    return Scaffold(
      appBar: AppBar(
        title: const CustomLayoutTitleAppBar(),
      
      ),
      body: const CustomBodyLayout(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

