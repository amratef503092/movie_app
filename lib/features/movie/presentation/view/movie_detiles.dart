
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/domain/entities/movie_entity.dart';

class MovieDetilesScreen extends StatelessWidget 
{
  const MovieDetilesScreen({super.key ,required this.movie});
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        children: [
          Hero(
            
            tag: movie.id,
            
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${movie.posterPath}",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
                    Padding( 
                      padding:  EdgeInsets.only(top: 20.0.sp , left: 10.0)
                       ,child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 30,
                        ))),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 1.sh * 0.5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-0.00, 1.00),
                      end: Alignment(0, -1),
                      colors: [Color(0xFF111111), Color(0xFF111111), Color(0x00111111)],
                    ),
                  ),
                  child: SizedBox(
                    width: 1.sw,
                    height: 1.sh * 0.5,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            movie.title,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              
                            
                            )
                          ),
                          const SizedBox(height: 10),
                          Text(
                            movie.overview,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      
        ],
      ),
    );
  }
}