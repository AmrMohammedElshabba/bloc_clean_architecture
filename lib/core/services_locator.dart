  import 'package:bloc_clean_architecture/core/api_client/api_client.dart';
import 'package:bloc_clean_architecture/moves/data/datasource/movies_remote_data_source.dart';
import 'package:bloc_clean_architecture/moves/data/repository/movies_repository_impl.dart';
import 'package:bloc_clean_architecture/moves/domain/repository/base_movies_repository.dart';
import 'package:bloc_clean_architecture/moves/domain/usecases/now_playing_movies_usecase.dart';
import 'package:bloc_clean_architecture/moves/domain/usecases/popular_movies_usecase.dart';
import 'package:bloc_clean_architecture/moves/domain/usecases/top_rated_movies_usecase.dart';
import 'package:bloc_clean_architecture/moves/presentation/controller/movies_bloc.dart';
import 'package:bloc_clean_architecture/moves/presentation/controller/movies_details_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../moves/domain/usecases/movies_details_usecase.dart';
import '../moves/domain/usecases/movies_recommendation_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MoviesDetailsBloc(sl(), sl()));

    ///Api client
    sl.registerLazySingleton<RemoteService>(() => RemoteService(Dio()));

    ///Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesRecommendationUseCase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepositoryImpl(sl()));

    ///Data source
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource(sl()));
  }
}
