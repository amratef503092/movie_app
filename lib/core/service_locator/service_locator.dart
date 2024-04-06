import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_app/features/favourite/presentation/cubit/favourite_cubit.dart';
import 'package:movie_app/features/home/domain/repositories/get_movie_repo.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/favourite/data/datasources/favourite_local_data_source.dart';
import '../../features/favourite/data/repositories/favourite_repo_impl.dart';
import '../../features/favourite/domain/repositories/favourite_repo.dart';
import '../../features/favourite/domain/usecases/favourite_use_case.dart';
import '../../features/home/data/datasources/get_movie_local_data_source.dart';
import '../../features/home/data/datasources/get_movie_remote_data_source.dart';
import '../../features/home/data/repositories/get_movie_repo.dart';
import '../../features/home/domain/usecases/get_movie_usecase.dart';
import '../../features/search/data/datasources/search_movie_remote_data_source.dart';
import '../../features/search/data/repositories/search_repo_impl.dart';
import '../../features/search/domain/repositories/search_repo.dart';
import '../../features/search/domain/usecases/seatch_usecase.dart';
import '../api/dio_consumers.dart';
import '../api/end_point.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async 
{
  // shared
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // data sources
  sl.registerLazySingleton<GetMovieRemoteDataSource>(
      () => GetMovieRemoteDataSourceImpl(sl<DioConsumer>()));
  sl.registerLazySingleton<GetMovieLocalDataSource>(
      () => GetMovieLocalDataSourceImpl(sl<SharedPreferences>()));
  sl.registerLazySingleton<FavouriteLocalDataSource>(
      () => FavouriteLocalDataSourceImpl(sl<SharedPreferences>()));
  sl.registerLazySingleton<SearchMovieRemoteDataSourceImpl>(
      () => SearchMovieRemoteDataSourceImpl(sl<DioConsumer>()));    

  // repo
  sl.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<FavouriteRepoMovie>(() => FavouriteRepoImpl(sl()));


  sl.registerLazySingleton<SearchRepository>(
      () => SearchRepoImpl(remoteDataSource: sl()));
  // usecase
  // home UseCase
  sl.registerLazySingleton(() => GetMovieUseCase(sl()));
  sl.registerLazySingleton(() => SearchUseCase(sl()));
  // favourite UseCase
  sl.registerLazySingleton(() => FavouriteAddMovieUserCase(sl()));
  sl.registerLazySingleton(() => FavouriteRemoveMovieUserCase(sl()));
  sl.registerLazySingleton(() => GetFavouriteUserCase(sl()));

  // cubit
  sl.registerFactory<MovieCubit>(() => MovieCubit(sl()));
  sl.registerFactory<FavouriteCubit>(() => 
  FavouriteCubit(
      favouriteAddMovieUserCase: sl(),
      favouriteRemoveMovieUserCase: sl(),
      getFavouriteUserCase: sl()));

      sl.registerFactory<SearchCubit>(() =>  SearchCubit(
      searchUseCase: sl(),
      ));
  // dio
  sl.registerLazySingleton(() => Dio(getBaseOptions()));
  sl.registerLazySingleton(() => DioConsumer(dio: sl<Dio>()));

  // network Info
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}
