import 'package:bloc_clean_architecture/moves/data/models/movies_recommendation_model.dart';
import 'package:dartz/dartz.dart';
import '../repository/base_movies_repository.dart';

class GetMoviesRecommendationUseCase {
  BaseMoviesRepository baseMoviesRepository;

  GetMoviesRecommendationUseCase(this.baseMoviesRepository);

  Future<Either<String, MoviesRecommendationModel>> getMoviesRecommendation(
      int id) async {
    return await baseMoviesRepository.getMoviesRecommendation(id);
  }
}
