import 'package:bloc_clean_architecture/moves/data/datasource/movies_remote_data_source.dart';
import 'package:bloc_clean_architecture/moves/data/models/movies_details_model.dart';
import 'package:bloc_clean_architecture/moves/data/models/movies_recommendation_model.dart';
import 'package:bloc_clean_architecture/moves/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../models/movies_model.dart';

class MoviesRepositoryImpl extends BaseMoviesRepository {
  BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepositoryImpl(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<String, MoviesModel>> getNowPlaying() async {
    final response = await baseMoviesRemoteDataSource.getNowPlayingMovies();
    return response.when(
        noConnection: () => const Left('No Internet Connection'),
        failure: (message) => Left(message),
        data: (data) => Right(data));
  }

  @override
  Future<Either<String, MoviesModel>> getPopularMovies() async {
    final response = await baseMoviesRemoteDataSource.getPopularMovies();
    return response.when(
        noConnection: () => const Left('No Internet Connection'),
        failure: (message) => Left(message),
        data: (data) => Right(data));
  }

  @override
  Future<Either<String, MoviesModel>> getTopRatedMovies() async {
    final response = await baseMoviesRemoteDataSource.getTopRatedMovies();
    return response.when(
        noConnection: () => const Left('No Internet Connection'),
        failure: (message) => Left(message),
        data: (data) => Right(data));
  }

  @override
  Future<Either<String, MoviesDetailsModel>> getMoviesDetails(int id) async {
    final response = await baseMoviesRemoteDataSource.getMoviesDetails(id);
    return response.when(
        noConnection: () => const Left('No Internet Connection'),
        failure: (message) => Left(message),
        data: (data) => Right(data));
  }

  @override
  Future<Either<String, MoviesRecommendationModel>> getMoviesRecommendation(
      int id) async {
    final response =
        await baseMoviesRemoteDataSource.getMoviesRecommendation(id);
    return response.when(
        noConnection: () => const Left('No Internet Connection'),
        failure: (message) => Left(message),
        data: (data) => Right(data));
  }
}
