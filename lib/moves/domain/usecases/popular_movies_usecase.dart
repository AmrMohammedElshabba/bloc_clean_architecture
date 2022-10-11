import 'package:dartz/dartz.dart';

import '../../data/models/movies_model.dart';
import '../repository/base_movies_repository.dart';

class GetPopularMoviesUseCase {
  BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<Either<String, MoviesModel >> getPopularMovies() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
