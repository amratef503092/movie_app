

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/home/domain/entities/movie_entity.dart';
import '../../features/home/presentation/widgets/custom_cached_network_image.dart';
import '../../features/home/presentation/widgets/favourite_icon_widget.dart';
import '../../features/movie/presentation/view/movie_detiles.dart';
import '../util/color_manager/color_manager.dart';

class CustomCardMovie extends StatelessWidget {
  const CustomCardMovie({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MovieDetilesScreen(
            movie: movie,
          );
        }));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 273.h,
            width: 185.w,
            // padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: ColorManager.primaryColor,
            ),
            child: Stack(
              children: 
              [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: Hero(
                    tag: movie.id,
                    child: CustomCahedNetworkImage(
                      
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                    ),
                  ),
                ),
               Align(
                alignment: Alignment.topRight
                ,child: FavouriteIconWidget(movie: movie)),
      
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0 ),
            child: Text(movie.title ,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center, 
            style: 
            Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 18.sp,
                               
            )),
          ),
        ],
      ),
    );
  }
}
