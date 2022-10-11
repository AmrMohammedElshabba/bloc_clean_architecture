import 'package:bloc_clean_architecture/moves/data/models/movies_details_model.dart';
import 'package:bloc_clean_architecture/moves/data/models/movies_recommendation_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/movies_model.dart';

abstract class BaseMoviesRepository {
  Future<Either<String, MoviesModel>> getNowPlaying();

  Future<Either<String, MoviesModel>> getPopularMovies();

  Future<Either<String, MoviesModel>> getTopRatedMovies();

  Future<Either<String, MoviesDetailsModel>> getMoviesDetails(int id);

  Future<Either<String, MoviesRecommendationModel>> getMoviesRecommendation(int id);
}
