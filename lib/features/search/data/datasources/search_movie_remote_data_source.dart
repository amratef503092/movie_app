import 'package:movie_app/core/api/dio_consumers.dart';
import 'package:movie_app/core/api/end_point.dart';
import 'package:movie_app/features/home/data/models/get_movie_model.dart';

abstract class SearchMovieRemoteDataSource {
  Future<GetMovieModel> searchMovie(int page , String query);
}

class SearchMovieRemoteDataSourceImpl implements SearchMovieRemoteDataSource 
{
  SearchMovieRemoteDataSourceImpl(this.dioConsumer);
  DioConsumer dioConsumer;
  @override
  Future<GetMovieModel> searchMovie(int page , query) 
  async
  {
    final response = await dioConsumer.
    get(EndPoints.searchMovie ,
    queryParameters: 
    {
      'page' : page,
      "query" : query,
      "api_key" : EndPoints.apiKey
    }
    );
    return GetMovieModel.fromJson(response.data);
  }

}