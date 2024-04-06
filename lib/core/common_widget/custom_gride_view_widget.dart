
import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entities/movie_entity.dart';
import 'custom_card_movie.dart';

class CustomGridViewWidget extends StatelessWidget {
  const CustomGridViewWidget({
    super.key,
    required this.listMovie,
     this.scrollController
  });

  final ScrollController ? scrollController;
  final List<MovieEntity> listMovie;

  @override
  Widget build(BuildContext context) 
  {
    return listMovie.isEmpty ? const Center(child: Text("No Movies Found" , 
    style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
    ),) 
    :
     GridView.builder(
      controller:scrollController ?? ScrollController(),
        itemCount: listMovie.isEmpty ? 0 : listMovie.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          final movie = listMovie[index];
          return CustomCardMovie(movie: movie);
        });
  }
}

