import 'package:movie_app/core/api/dio_consumers.dart';
import 'package:movie_app/core/api/end_point.dart';
import 'package:movie_app/features/home/data/models/get_movie_model.dart';

abstract class GetMovieRemoteDataSource {
  Future<GetMovieModel> getDiscoverMovie(int page);
}

class GetMovieRemoteDataSourceImpl implements GetMovieRemoteDataSource 
{
  GetMovieRemoteDataSourceImpl(this.dioConsumer);
  DioConsumer dioConsumer;
  @override
  Future<GetMovieModel> getDiscoverMovie(int page) 
  async
  {
    final response = await dioConsumer.
    get(EndPoints.discoverEndpoint ,
    queryParameters: 
    {
      'page' : page,
      "api_key" : EndPoints.apiKey
    }
    );
    return GetMovieModel.fromJson(response.data);
  }

}