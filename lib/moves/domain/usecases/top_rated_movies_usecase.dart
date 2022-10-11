import 'package:dartz/dartz.dart';

import '../../data/models/movies_model.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase {
  BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  Future<Either<String, MoviesModel>> getTopRatedMovies() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
